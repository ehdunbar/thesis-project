view: schedule {
  sql_table_name: golf_stats.Schedule ;;

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: season__id {
    type: string
    sql: ${TABLE}.season__id ;;
  }

  dimension: season__year {
    type: number
    sql: ${TABLE}.season__year ;;
  }

  dimension: tour__id {
    type: string
    sql: ${TABLE}.tour__id ;;
  }

  dimension: tour__name {
    type: string
    sql: ${TABLE}.tour__name ;;
  }

  dimension_group: tournaments__end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.tournaments__end_date ;;
  }

  dimension: tournaments__id {
    type: string
    sql: ${TABLE}.tournaments__id ;;
  }

  dimension: tournaments__name {
    type: string
    sql: ${TABLE}.tournaments__name ;;
  }

  dimension_group: tournaments__start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.tournaments__start_date ;;
  }

  dimension: tournaments__venue__courses__holes__number {
    type: number
    sql: ${TABLE}.tournaments__venue__courses__holes__number ;;
  }

  dimension: tournaments__venue__courses__holes__par {
    type: number
    sql: ${TABLE}.tournaments__venue__courses__holes__par ;;
  }

  dimension: tournaments__venue__courses__holes__yardage {
    type: number
    sql: ${TABLE}.tournaments__venue__courses__holes__yardage ;;
  }

  dimension: tournaments__venue__courses__id {
    type: string
    sql: ${TABLE}.tournaments__venue__courses__id ;;
  }

  dimension: tournaments__venue__courses__name {
    type: string
    sql: ${TABLE}.tournaments__venue__courses__name ;;
  }

  dimension: tournaments__venue__courses__par {
    type: number
    sql: ${TABLE}.tournaments__venue__courses__par ;;
  }

  dimension: tournaments__venue__courses__yardage {
    type: number
    sql: ${TABLE}.tournaments__venue__courses__yardage ;;
  }

  dimension: tournaments__venue__id {
    type: string
    sql: ${TABLE}.tournaments__venue__id ;;
  }

  dimension: tournaments__venue__name {
    type: string
    sql: ${TABLE}.tournaments__venue__name ;;
  }

  dimension: tournaments__venue__zipcode {
    type: number
    sql: ${TABLE}.tournaments__venue__zipcode ;;
  }

  measure: count {
    type: count
    drill_fields: [tour__name, tournaments__name, tournaments__venue__name, tournaments__venue__courses__name]
  }
}
