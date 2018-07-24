view: player_ranks {

  derived_table: {
    sql: SELECT CONCAT(players__first_name, ' ', players__last_name) as player_name, season__year as season_year, players__statistics__events_played as events_played,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__birdies_per_round DESC) as birdies_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__drive_acc DESC) as drive_acc_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__drive_avg DESC) as drive_avg_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__holes_per_eagle ASC) as holes_eagle_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__putt_avg ASC) as putt_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__sand_saves_pct DESC) as sand_saves_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__scoring_avg ASC) as scoring_avg_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__gir_pct DESC) as gir_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__scrambling_pct DESC) as scrambling_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__strokes_gained DESC) as SGP_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__strokes_gained_tee_green DESC) as SGD_rank,
          DENSE_RANK() OVER(PARTITION BY season__year ORDER BY players__statistics__strokes_gained_total DESC) as SGT_rank
          FROM golf_stats.player_statistics;;
  }


dimension: drive_avg_rank{
  type: number
  sql: ${TABLE}.drive_avg_rank ;;
}


  dimension: gir_rank{
    type: number
    sql: ${TABLE}.gir_rank ;;
  }

  dimension: birdies_rank{
    type: number
    sql: ${TABLE}.birdies_rank ;;
  }

  dimension: drive_acc_rank{
    type: number
    sql: ${TABLE}.drive_acc_rank ;;
  }

  dimension: holes_eagle_rank{
    type: number
    sql: ${TABLE}.holes_eagle_rank ;;
  }

  dimension: putt_rank{
    type: number
    sql: ${TABLE}.putt_rank ;;
  }

  dimension: sand_saves_rank{
    type: number
    sql: ${TABLE}.sand_saves_rank ;;
  }

  dimension: scoring_avg_rank{
    type: number
    sql: ${TABLE}.scoring_avg_rank ;;
  }

  dimension: scrambling_rank{
    type: number
    sql: ${TABLE}.scrambling_rank ;;
  }

  dimension: SGP_rank{
    type: number
    sql: ${TABLE}.SGP_rank ;;
  }

  dimension: SGD_rank{
    type: number
    sql: ${TABLE}.SGD_rank ;;
  }

  dimension: SGT_rank{
    type: number
    sql: ${TABLE}.SGT_rank ;;
  }

dimension: events_played {
  type: number
  sql: ${TABLE}.events_played ;;
}

dimension: player_name {
  type: string
  sql: ${TABLE}.player_name ;;
}

dimension: season_year {
  type: number
  sql: ${TABLE}.season_year ;;
}

}
