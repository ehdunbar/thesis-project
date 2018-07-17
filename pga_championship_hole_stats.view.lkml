view: pga_championship_hole_stats {
  sql_table_name: golf_stats.PGA_Championship_Hole_Stats ;;

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

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: rounds__courses__holes__avg_diff {
    type: number
    sql: ${TABLE}.rounds__courses__holes__avg_diff ;;
  }

  dimension: rounds__courses__holes__birdies {
    type: number
    sql: ${TABLE}.rounds__courses__holes__birdies ;;
  }

  dimension: rounds__courses__holes__bogeys {
    type: number
    sql: ${TABLE}.rounds__courses__holes__bogeys ;;
  }

  dimension: rounds__courses__holes__double_bogeys {
    type: number
    sql: ${TABLE}.rounds__courses__holes__double_bogeys ;;
  }

  dimension: rounds__courses__holes__eagles {
    type: number
    sql: ${TABLE}.rounds__courses__holes__eagles ;;
  }

  dimension: rounds__courses__holes__holes_in_one {
    type: number
    sql: ${TABLE}.rounds__courses__holes__holes_in_one ;;
  }

  dimension: rounds__courses__holes__number {
    type: number
    sql: ${TABLE}.rounds__courses__holes__number ;;
  }

  dimension: rounds__courses__holes__other_scores {
    type: number
    sql: ${TABLE}.rounds__courses__holes__other_scores ;;
  }

  dimension: rounds__courses__holes__par {
    type: number
    sql: ${TABLE}.rounds__courses__holes__par ;;
  }

  dimension: rounds__courses__holes__pars {
    type: number
    sql: ${TABLE}.rounds__courses__holes__pars ;;
  }

  dimension: rounds__courses__holes__players {
    type: number
    sql: ${TABLE}.rounds__courses__holes__players ;;
  }

  dimension: rounds__courses__holes__sequence {
    type: number
    sql: ${TABLE}.rounds__courses__holes__sequence ;;
  }

  dimension: rounds__courses__holes__strokes {
    type: number
    sql: ${TABLE}.rounds__courses__holes__strokes ;;
  }

  dimension: rounds__courses__holes__strokes_avg {
    type: number
    sql: ${TABLE}.rounds__courses__holes__strokes_avg ;;
  }

  dimension: rounds__courses__id {
    type: string
    sql: ${TABLE}.rounds__courses__id ;;
  }

  dimension: rounds__courses__name {
    type: string
    sql: ${TABLE}.rounds__courses__name ;;
  }

  dimension: rounds__courses__par {
    type: number
    sql: ${TABLE}.rounds__courses__par ;;
  }

  dimension: rounds__courses__yardage {
    type: number
    sql: ${TABLE}.rounds__courses__yardage ;;
  }

  dimension: rounds__id {
    type: string
    sql: ${TABLE}.rounds__id ;;
  }

  dimension: rounds__number {
    type: number
    sql: ${TABLE}.rounds__number ;;
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
    drill_fields: [id, seasons__tour__name, rounds__courses__name, name]
  }
}
