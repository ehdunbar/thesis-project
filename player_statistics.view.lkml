view: player_statistics {
  sql_table_name: golf_stats.player_statistics ;;


  dimension: players__id {
    type: number
    sql: ${TABLE}.players__id ;;
  }

  dimension: players__country {
    type: string
    sql: ${TABLE}.players__country ;;
  }

  dimension: players_name {
    type: string
    sql: concat(${TABLE}.players__first_name, ' ', ${TABLE}.players__last_name) ;;
  }

  dimension: players__statistics__birdies_per_round {
    label: "Birdies Per Round"
    type: number
    sql: ${TABLE}.players__statistics__birdies_per_round ;;
  }

  dimension: players__statistics__cuts {
    label: "Cuts"
    type: number
    sql: ${TABLE}.players__statistics__cuts ;;
  }

  dimension: players__statistics__cuts_made {
    label: "Cuts Made"
    type: number
    sql: ${TABLE}.players__statistics__cuts_made ;;
  }

  dimension: players__statistics__drive_acc {
    label: "Driving Accuracy"
    type: number
    sql: ${TABLE}.players__statistics__drive_acc ;;
  }

  dimension: players__statistics__drive_avg {
    label: "Driving Average"
    type: number
    sql: ${TABLE}.players__statistics__drive_avg ;;
  }

  dimension: players__statistics__earnings {
    label: "Total Earnings"
    type: number
    sql: ${TABLE}.players__statistics__earnings ;;
  }

  dimension: players__statistics__earnings_rank {
    label: "Earnings Rank"
    type: number
    sql: ${TABLE}.players__statistics__earnings_rank ;;
  }

  dimension: players__statistics__events_played {
    label: "Events Played"
    type: number
    sql: ${TABLE}.players__statistics__events_played ;;
  }

  dimension: players__statistics__first_place {
    label: "First Place Finishes"
    type: number
    sql: ${TABLE}.players__statistics__first_place ;;
  }

  dimension: players__statistics__gir_pct {
    label: "Greens in Regulation Percentage"
    type: number
    sql: ${TABLE}.players__statistics__gir_pct ;;
  }

  dimension: players__statistics__hole_proximity_avg {
    label: "Hole Proximity Average"
    type: string
    sql: ${TABLE}.players__statistics__hole_proximity_avg ;;
  }

  dimension: players__statistics__holes_per_eagle {
    label: "Holes Per Eagle"
    type: number
    sql: ${TABLE}.players__statistics__holes_per_eagle ;;
  }

  dimension: players__statistics__points {
    label: "Fedex Cup Points"
    type: number
    sql: ${TABLE}.players__statistics__points ;;
  }

  dimension: players__statistics__points_rank {
    type: number
    sql: ${TABLE}.players__statistics__points_rank ;;
  }

  dimension: players__statistics__putt_avg {
    label: "Putting Average"
    type: number
    sql: ${TABLE}.players__statistics__putt_avg ;;
  }

  dimension: players__statistics__sand_saves_pct {
    label: "Sand Save Percentage"
    type: string
    sql: ${TABLE}.players__statistics__sand_saves_pct ;;
  }

  dimension: players__statistics__scoring_avg {
    label: "Scoring Average"
    type: number
    sql: ${TABLE}.players__statistics__scoring_avg ;;
  }

  dimension: players__statistics__scrambling_pct {
    label: "Scrambling Percentage"
    type: number
    sql: ${TABLE}.players__statistics__scrambling_pct ;;
  }

  dimension: players__statistics__second_place {
    label: "Second Place Finishes"
    type: number
    sql: ${TABLE}.players__statistics__second_place ;;
  }

  dimension: players__statistics__strokes_gained {
    label: "Strokes Gained Putting"
    type: number
    sql: ${TABLE}.players__statistics__strokes_gained ;;
  }

  dimension: players__statistics__strokes_gained_tee_green {
    label: "Strokes Gained Tee to Green"
    type: number
    sql: ${TABLE}.players__statistics__strokes_gained_tee_green ;;
  }

  dimension: players__statistics__strokes_gained_total {
    label: "Strokes Gained Total"
    type: number
    sql: ${TABLE}.players__statistics__strokes_gained_total ;;
  }

  dimension: players__statistics__third_place {
    label: "Third Place Finishes"
    type: number
    sql: ${TABLE}.players__statistics__third_place ;;
  }

  dimension: players__statistics__top_10 {
    label: "Top 10 Finishes"
    type: number
    sql: ${TABLE}.players__statistics__top_10 ;;
  }

  dimension: players__statistics__top_25 {
    label: "Top 25 Finishes"
    type: number
    sql: ${TABLE}.players__statistics__top_25 ;;
  }

  dimension: players__statistics__total_driving {
    label: "Total Driving"
    type: number
    sql: ${TABLE}.players__statistics__total_driving ;;
  }

  dimension: players__statistics__withdrawals {
    label: "Withdrawls"
    type: number
    sql: ${TABLE}.players__statistics__withdrawals ;;
  }

  dimension: players__statistics__world_rank {
    label: "World Rank"
    type: number
    sql: ${TABLE}.players__statistics__world_rank ;;
  }

  dimension: season__year {
    type: number
    sql: ${TABLE}.season__year ;;
  }

  dimension: tour__name {
    label: "Tour Name"
    type: string
    sql: ${TABLE}.tour__name ;;
  }

  measure: count {
    type: count
    drill_fields: [players_name, tour__name]
  }
}
