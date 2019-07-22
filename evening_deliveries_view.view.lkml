view: evening_deliveries_view {
  sql_table_name: CC.EVENING_DELIVERIES_VIEW ;;

  dimension_group: booking {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."BOOKING_DATE" ;;
  }

  dimension: col {
    type: string
    sql: ${TABLE}."COL" ;;
  }

  dimension: col_latitude {
    type: number
    sql: ${TABLE}."COL_LATITUDE" ;;
  }

  dimension: col_longitude {
    type: number
    sql: ${TABLE}."COL_LONGITUDE" ;;
  }

  dimension: customer_key {
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: del {
    type: string
    sql: ${TABLE}."DEL" ;;
  }

  dimension: del_latitude {
    type: number
    sql: ${TABLE}."DEL_LATITUDE" ;;
  }

  dimension: del_longitude {
    type: number
    sql: ${TABLE}."DEL_LONGITUDE" ;;
  }

  dimension_group: deliver_by {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVER_BY" ;;
  }

  dimension_group: deliver {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVER_DATE" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: driver {
    type: string
    sql: ${TABLE}."DRIVER" ;;
  }

  dimension: job_circuit_desc {
    type: string
    sql: ${TABLE}."JOB_CIRCUIT_DESC" ;;
  }

  dimension: job_number {
    type: number
    sql: ${TABLE}."JOB_NUMBER" ;;
  }

  dimension: mobile {
    type: string
    sql: ${TABLE}."MOBILE" ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}."REFERENCE" ;;
  }

  dimension: sc {
    type: string
    sql: ${TABLE}."SC" ;;
  }

  dimension: service_code {
    type: string
    sql: ${TABLE}."SERVICE_CODE" ;;
  }

  dimension: service_description {
    type: string
    sql: ${TABLE}."SERVICE_DESCRIPTION" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: vehicle_code {
    type: string
    sql: ${TABLE}."VEHICLE_CODE" ;;
  }

  dimension: vehicle_desc {
    type: string
    sql: ${TABLE}."VEHICLE_DESC" ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_name]
  }
}
