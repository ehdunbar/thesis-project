view: masters_leaderboard {
  sql_table_name: golf_stats.Masters_Leaderboard ;;

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

  dimension: leaderboard__first_name {
    type: string
    sql: ${TABLE}.leaderboard__first_name ;;
  }

  dimension: leaderboard__id {
    type: string
    sql: ${TABLE}.leaderboard__id ;;
  }

  dimension: leaderboard__last_name {
    type: string
    sql: ${TABLE}.leaderboard__last_name ;;
  }

  dimension: leaderboard__position {
    type: number
    sql: ${TABLE}.leaderboard__position ;;
  }

  dimension: leaderboard__rounds__birdies {
    type: number
    sql: ${TABLE}.leaderboard__rounds__birdies ;;
  }

  dimension: leaderboard__rounds__bogeys {
    type: number
    sql: ${TABLE}.leaderboard__rounds__bogeys ;;
  }

  dimension: leaderboard__rounds__double_bogeys {
    type: number
    sql: ${TABLE}.leaderboard__rounds__double_bogeys ;;
  }

  dimension: leaderboard__rounds__eagles {
    type: number
    sql: ${TABLE}.leaderboard__rounds__eagles ;;
  }

  dimension: leaderboard__rounds__holes_in_one {
    type: number
    sql: ${TABLE}.leaderboard__rounds__holes_in_one ;;
  }

  dimension: leaderboard__rounds__other_scores {
    type: number
    sql: ${TABLE}.leaderboard__rounds__other_scores ;;
  }

  dimension: leaderboard__rounds__pars {
    type: number
    sql: ${TABLE}.leaderboard__rounds__pars ;;
  }

  dimension: leaderboard__rounds__score {
    type: number
    sql: ${TABLE}.leaderboard__rounds__score ;;
  }

  dimension: leaderboard__rounds__sequence {
    type: number
    sql: ${TABLE}.leaderboard__rounds__sequence ;;
  }

  dimension: leaderboard__rounds__strokes {
    type: number
    sql: ${TABLE}.leaderboard__rounds__strokes ;;
  }

  dimension: leaderboard__rounds__thru {
    type: number
    sql: ${TABLE}.leaderboard__rounds__thru ;;
  }

  dimension: leaderboard__score {
    type: number
    sql: ${TABLE}.leaderboard__score ;;
  }

  dimension: leaderboard__strokes {
    type: number
    sql: ${TABLE}.leaderboard__strokes ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
    drill_fields: [id, leaderboard__first_name, seasons__tour__name, leaderboard__last_name, name]
  }
}
