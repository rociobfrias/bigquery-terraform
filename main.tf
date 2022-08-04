provider "google" {
  region      = "europe-west1"
  zone        = "EU"
  project     = "pocdatacapgemini"
}

#Deploy stationary shop dataset
resource "google_bigquery_dataset" "stationary" {
  dataset_id                  = var.stationary
  friendly_name               = "stationary"
  description                 = "Stationary Shop dataset"
  location                    = var.stationary_DS_location #check the location
 
  #default_table_expiration_ms = 3600000

}

output "stationary_dataset_id" {
  description = "The ID of the dataset "
  value       = google_bigquery_dataset.stationary.dataset_id
}

# notebook table
resource "google_bigquery_table" "tbl_notebook" {
  dataset_id = google_bigquery_dataset.stationary.dataset_id
  table_id = var.tbl_notebook
  deletion_protection = false
  
  
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF
}

# pen table
resource "google_bigquery_table" "tbl_pen" {
  dataset_id = google_bigquery_dataset.stationary.dataset_id
  table_id = var.tbl_pen
  deletion_protection = false
  
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF
}




