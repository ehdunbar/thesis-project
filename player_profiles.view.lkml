view: player_profiles {
  sql_table_name: golf_stats.player_profiles ;;

  dimension: players__birth_place {
    type: string
    sql: ${TABLE}.players__birth_place ;;
  }

  dimension_group: players__birthday {
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
    sql: ${TABLE}.players__birthday ;;
  }

  dimension: players__college {
    type: string
    sql: ${TABLE}.players__college ;;
  }

  dimension: players__country {
    type: string
    sql: ${TABLE}.players__country ;;
  }

  dimension: players__first_name {
    type: string
    sql: ${TABLE}.players__first_name ;;
  }

  dimension: players__height {
    type: string
    sql: ${TABLE}.players__height ;;
  }

  dimension: players__id {
    type: string
    sql: ${TABLE}.players__id ;;
  }

  dimension: players__last_name {
    type: string
    sql: ${TABLE}.players__last_name ;;
  }

  dimension: players__member {
    type: yesno
    sql: ${TABLE}.players__member ;;
  }

  dimension: players__residence {
    type: string
    sql: ${TABLE}.players__residence ;;
  }

  dimension: players__turned_pro {
    type: string
    sql: ${TABLE}.players__turned_pro ;;
  }

  dimension_group: players__updated {
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
    sql: ${TABLE}.players__updated ;;
  }

  dimension: players__weight {
    type: string
    sql: ${TABLE}.players__weight ;;
  }

  dimension: season__year {
    type: number
    sql: ${TABLE}.season__year ;;
  }

  dimension: tour__name {
    type: string
    sql: ${TABLE}.tour__name ;;
  }

  measure: count {
    type: count
    drill_fields: [players__first_name, tour__name, players__last_name]
  }
}
