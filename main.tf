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
  delete_contents_on_destroy  = false
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
  deletion_protection = var.protection
    
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "zip",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "lat",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "lng",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "city",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "state_id",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "state_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "zcta",
    "type": "BOOLEAN",
    "mode": "NULLABLE"
  },
  {
    "name": "parent_zcta",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "population",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "density",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "county_fips",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "county_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "county_weights",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "county_names_all",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "county_fips_all",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "imprecise",
    "type": "BOOLEAN",
    "mode": "NULLABLE"
  },
  {
    "name": "military",
    "type": "BOOLEAN",
    "mode": "NULLABLE"
  },
  {
    "name": "timezone",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "zip_code",
    "type": "STRING",
    "mode": "NULLABLE"
  }
  
]
EOF
}

# articles table
resource "google_bigquery_table" "articles" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.articles
  deletion_protection = var.protection
  
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "article_id",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "product_code",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "prod_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "product_type_no",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "product_type_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "product_group_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "graphical_appearance_no",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "graphical_appearance_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "colour_group_code",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "colour_group_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "perceived_colour_value_id",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "perceived_colour_value_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "perceived_colour_master_id",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "perceived_colour_master_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "department_no",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "department_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "index_code",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "index_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "index_group_no",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "index_group_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "section_no",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "section_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "garment_group_no",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "garment_group_name",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "detail_desc",
    "type": "STRING",
    "mode": "NULLABLE"
  }
]
EOF
}

# customers table
resource "google_bigquery_table" "customers" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.customers
  deletion_protection = var.protection
  
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "customer_id",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "FN",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "Active",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "club_member_status",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "fashion_news_frequency",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "age",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "postal_code",
    "type": "STRING",
    "mode": "NULLABLE"
  }
]
EOF
}
  
# transactions_train table
resource "google_bigquery_table" "transactions_train" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.transactions_train
  deletion_protection = var.protection
  
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "t_dat",
    "type": "DATE",
    "mode": "NULLABLE"
  },
  {
    "name": "customer_id",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "article_id",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "price",
    "type": "FLOAT",
    "mode": "NULLABLE"
  },
  {
    "name": "sales_channel_id",
    "type": "INTEGER",
    "mode": "NULLABLE"
  }
]
EOF
}
  
# zip_code table
resource "google_bigquery_table" "zip_code" {
  dataset_id = google_bigquery_dataset.dev_pocdataset.dataset_id
  table_id = var.zip_code
  deletion_protection = var.protection
  
  time_partitioning {
    type = "DAY"
  }
  schema = <<EOF
[
  {
    "name": "zip",
    "type": "INTEGER",
    "mode": "NULLABLE"
  },
  {
    "name": "zip_code",
    "type": "STRING",
    "mode": "NULLABLE"
  }
]
EOF
}
  


