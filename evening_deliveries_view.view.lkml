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



  dimension: booking_d {
    type: date_time
    sql: ${TABLE}."BOOKING_DATE" ;;
  }

  dimension: pick_d {
    type: date_time
    sql: ${TABLE}."PICKUP_DATE" ;;
  }


  dimension: del_d {
    type: date_time
    sql: ${TABLE}."DELIVER_DATE" ;;
  }

  dimension: del_by_d {
    type: date_time
    sql: ${TABLE}."DELIVER_BY" ;;
  }


dimension: exceptions {
  type: string
  sql: ${TABLE}."EXCEPTIONS" ;;
}


  dimension: sla {
    type: string
    sql: ${TABLE}."SLA" ;;
  }



  dimension: total_exc_amount {
    type: number
    value_format_name: gbp_format
    sql: ${TABLE}."TOTAL_EXC_AMOUNT" ;;
  }

  dimension: total_inc_amount {
    type: number
    value_format_name: gbp_format
    sql: ${TABLE}."TOTAL_INC_AMOUNT" ;;
  }

  dimension: vat_amount {
    type: number
    value_format_name: gbp_format
    sql: ${TABLE}."VAT_AMOUNT" ;;
  }




  dimension: bookingvscollection {

    type: number
    sql: datediff(minute,${booking_d},${pick_d}) ;;

  }


  dimension: bookingvscollectioncategory2 {


    type:  string
    sql:

        case
      when ${bookingvscollection} is null then 'not allocated/not picked-up'
      when ${bookingvscollection} = 0 then 'on time'
      when ${bookingvscollection} >= 1    and ${bookingvscollection} <= 30   then '30 min or less are late'
      when ${bookingvscollection} <= -1   and ${bookingvscollection} >= -30  then '30 min or less are early'
      when ${bookingvscollection} >= 1    and ${bookingvscollection} <= 60   then '60 min or less are late'
      when ${bookingvscollection} <= -1   and ${bookingvscollection} >= -60  then '60 min or less are early'
      when ${bookingvscollection} > 60 then '60 min plus are late'
      when ${bookingvscollection} < -60 then '60 min plus are early'
      else 'other' end
      ;;


    }


  measure: avgofbookingvscollectionmin {
    label: "Avg_Bookings_vs_Collection_Minutes"
    hidden: yes
    type: average
    sql: ${bookingvscollection} ;;
    #drill_fields: [drilldown*]
    #html: <p style="color: red; font-size: 30px"> {{ value }} </p> ;;

  }


  measure: avg_collection_minutes {
    type: number
    sql: round(${avgofbookingvscollectionmin},1) ;;
    value_format: "#,##0"
    drill_fields: [drilldown*]
    #html: <p style="color: red; font-size: 10px"> {{ value }} </p> ;;

  }


  measure: count {
    type: count
    drill_fields: [drilldown*]
  }

  set: drilldown {
    fields: []
  }

}
