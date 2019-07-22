connection: "db"

# include all the views
include: "*.view"

named_value_format: gbp_format {
  value_format: "\"£\"#,##0"
}

label: "Collection Time Display"


datagroup: customer_reporting_evening_deliveries_default_datagroup {
   sql_trigger: SELECT count(*) FROM cc.evening_deliveries_view;;
  max_cache_age: "10 minute"
}

persist_with: customer_reporting_evening_deliveries_default_datagroup


explore: evening_deliveries_view {
  fields: [ALL_FIELDS*]
}
