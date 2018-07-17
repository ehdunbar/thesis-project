view: player_rankings {
  sql_table_name: golf_stats.Player_Rankings ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: players__country {
    type: string
    sql: ${TABLE}.players__country ;;
  }

  dimension: players__first_name {
    type: string
    sql: ${TABLE}.players__first_name ;;
  }

  dimension: players__id {
    type: string
    sql: ${TABLE}.players__id ;;
  }

  dimension: players__last_name {
    type: string
    sql: ${TABLE}.players__last_name ;;
  }

  dimension: players__prior_rank {
    type: number
    sql: ${TABLE}.players__prior_rank ;;
  }

  dimension: players__rank {
    type: number
    sql: ${TABLE}.players__rank ;;
  }

  dimension: players__statistics__avg_points {
    type: number
    sql: ${TABLE}.players__statistics__avg_points ;;
  }

  dimension: players__statistics__events_played {
    type: number
    sql: ${TABLE}.players__statistics__events_played ;;
  }

  dimension: players__statistics__points {
    type: number
    sql: ${TABLE}.players__statistics__points ;;
  }

  dimension: players__statistics__points_gained {
    type: number
    sql: ${TABLE}.players__statistics__points_gained ;;
  }

  dimension: players__statistics__points_lost {
    type: number
    sql: ${TABLE}.players__statistics__points_lost ;;
  }

  dimension: season {
    type: number
    sql: ${TABLE}.season ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: [id, players__first_name, name, players__last_name]
  }
}
