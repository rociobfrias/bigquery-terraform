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

# US_postal_code table
resource "google_bigquery_table" "US_postal_code" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.US_postal_code    

  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "zip",
    "type": "INTEGER",
    "mode": "NULLABLE",
  },
  {
    "name": "lat",
    "type": "FLOAT",
    "mode": "NULLABLE",
  },
  {
    "name": "lng",
    "type": "FLOAT",
    "mode": "NULLABLE",
  },
  {
    "name": "city",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "state_id",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "state_name",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "zcta",
    "type": "BOOLEAN",
    "mode": "NULLABLE",
  },
  {
    "name": "parent_zcta",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "population",
    "type": "INTEGER",
    "mode": "NULLABLE",
  },
  {
    "name": "density",
    "type": "FLOAT",
    "mode": "NULLABLE",
  },
  {
    "name": "county_fips",
    "type": "INTEGER",
    "mode": "NULLABLE",
  },
  {
    "name": "county_name",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "county_weights",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "county_names_all",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "county_fips_all",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "imprecise",
    "type": "BOOLEAN",
    "mode": "NULLABLE",
  },
  {
    "name": "military",
    "type": "BOOLEAN",
    "mode": "NULLABLE",
  },
  {
    "name": "timezone",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "zip_code",
    "type": "STRING",
    "mode": "NULLABLE",
  }
  
]
EOF
}

# articles table
resource "google_bigquery_table" "articles" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.articles
  
  
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
  }
]
EOF
}

# customers table
resource "google_bigquery_table" "customers" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.customers
  
# transactions_train table
resource "google_bigquery_table" "transactions_train" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.transactions_train
  
# zip_code table
resource "google_bigquery_table" "zip_code" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.zip_code
  


