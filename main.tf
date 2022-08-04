provider "google" {
  region      = "europe-west1"
  zone        = "EU"
  project     = "pocdatacapgemini"
}

#Deploy dev_pocdataset dataset
resource "google_bigquery_dataset" "dev_pocdataset" {
  dataset_id                  = var.dev_pocdataset
  friendly_name               = "dev_pocdataset"
  location                    = var.dev_pocdataset_DS_location #check the location
 
  #default_table_expiration_ms = 3600000

}

output "dev_pocdataset_dataset_id" {
  description = "The ID of the dataset"
  value       = google_bigquery_dataset.dev_pocdataset.dataset_id
}

# notebook table
resource "google_bigquery_table" "tbl_notebook" {
  dataset_id = google_bigquery_dataset.stationary.dataset_id
  table_id = var.tbl_notebook
  
  
  
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




