view: masters_rounds {
  sql_table_name: golf_stats.Masters_Rounds ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: round__id {
    type: string
    sql: ${TABLE}.round__id ;;
  }

  dimension: round__number {
    type: number
    sql: ${TABLE}.round__number ;;
  }

  dimension: round__players__birdies {
    type: number
    sql: ${TABLE}.round__players__birdies ;;
  }

  dimension: round__players__bogeys {
    type: number
    sql: ${TABLE}.round__players__bogeys ;;
  }

  dimension: round__players__course__holes__description {
    type: string
    sql: ${TABLE}.round__players__course__holes__description ;;
  }

  dimension: round__players__course__holes__number {
    type: number
    sql: ${TABLE}.round__players__course__holes__number ;;
  }

  dimension: round__players__course__holes__par {
    type: number
    sql: ${TABLE}.round__players__course__holes__par ;;
  }

  dimension: round__players__course__holes__yardage {
    type: number
    sql: ${TABLE}.round__players__course__holes__yardage ;;
  }

  dimension: round__players__course__id {
    type: string
    sql: ${TABLE}.round__players__course__id ;;
  }

  dimension: round__players__course__par {
    type: number
    sql: ${TABLE}.round__players__course__par ;;
  }

  dimension: round__players__course__yardage {
    type: number
    sql: ${TABLE}.round__players__course__yardage ;;
  }

  dimension: round__players__double_bogeys {
    type: number
    sql: ${TABLE}.round__players__double_bogeys ;;
  }

  dimension: round__players__eagles {
    type: number
    sql: ${TABLE}.round__players__eagles ;;
  }

  dimension: round__players__first_name {
    type: string
    sql: ${TABLE}.round__players__first_name ;;
  }

  dimension: round__players__id {
    type: string
    sql: ${TABLE}.round__players__id ;;
  }

  dimension: round__players__last_name {
    type: string
    sql: ${TABLE}.round__players__last_name ;;
  }

  dimension: round__players__pars {
    type: number
    sql: ${TABLE}.round__players__pars ;;
  }

  dimension: round__players__score {
    type: number
    sql: ${TABLE}.round__players__score ;;
  }

  dimension: round__players__scores__number {
    type: number
    sql: ${TABLE}.round__players__scores__number ;;
  }

  dimension: round__players__scores__par {
    type: number
    sql: ${TABLE}.round__players__scores__par ;;
  }

  dimension: round__players__scores__strokes {
    type: number
    sql: ${TABLE}.round__players__scores__strokes ;;
  }

  dimension: round__players__scores__yardage {
    type: number
    sql: ${TABLE}.round__players__scores__yardage ;;
  }

  dimension: round__players__strokes {
    type: number
    sql: ${TABLE}.round__players__strokes ;;
  }

  dimension: seasons__id {
    type: string
    sql: ${TABLE}.seasons__id ;;
  }

  dimension: seasons__tour__id {
    type: string
    sql: ${TABLE}.seasons__tour__id ;;
  }

  dimension: seasons__tour__name {
    type: string
    sql: ${TABLE}.seasons__tour__name ;;
  }

  dimension: seasons__year {
    type: number
    sql: ${TABLE}.seasons__year ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id, round__players__first_name, seasons__tour__name, round__players__last_name, name]
  }
}
