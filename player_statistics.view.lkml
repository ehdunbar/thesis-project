view: player_statistics {
  sql_table_name: golf_stats.player_statistics ;;

  filter: player_filter {
    suggest_dimension: players_name
    type: string
  }

  dimension: group_yes_no {
    hidden: yes
    type: yesno
    sql: {% condition player_filter %} ${players_name} {% endcondition %};;
  }

  dimension: hole_proximity {
    type: number
    sql: ((cast(SUBSTR(${TABLE}.players__statistics__hole_proximity_avg, 0, 2) as INT64) * 12) +
          cast(SUBSTR(TRIM(${TABLE}.players__statistics__hole_proximity_avg, " \""), 4, 3) as INT64)) / 12 ;;
    value_format: "0.## \" ft\""
  }

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
    value_format_name: usd_0
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
    type: number
    sql: cast(Case when (${TABLE}.players__statistics__sand_saves_pct = "NA") then null else ${TABLE}.players__statistics__sand_saves_pct end as float64) ;;
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

  measure: average_strokes_gained_putting {
    type: average
    sql: ${players__statistics__strokes_gained} ;;
    value_format_name: decimal_2
    }
  measure: average_strokes_gained_putting_player_filter{
    type: average
    sql: ${players__statistics__strokes_gained} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: decimal_2
    }

  measure: average_strokes_gained_driving {
    type: average
    sql: ${players__statistics__strokes_gained_tee_green} ;;
    value_format_name: decimal_2
    }
  measure: average_strokes_gained_driving_player_filter{
    type: average
    sql: ${players__statistics__strokes_gained_tee_green} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: decimal_2
    }

  measure: average_strokes_gained_total {
    type: average
    sql: ${players__statistics__strokes_gained_total} ;;
    value_format_name: decimal_2
  }
  measure: average_strokes_gained_total_player_filter{
    type: average
    sql: ${players__statistics__strokes_gained_total} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: decimal_2
    }

  measure: average_birdies_per_round {
    type: average
    sql: ${players__statistics__birdies_per_round} ;;
    value_format_name: "decimal_2"
  }
  measure: average_birdies_per_round_player_filter{
    type: average
    sql: ${players__statistics__birdies_per_round} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: average_driving_accuracy {
    type: average
    sql: ${players__statistics__drive_acc} ;;
    value_format_name: "decimal_2"
  }
  measure: average_driving_accuraccy_player_filter{
    type: average
    sql: ${players__statistics__drive_acc} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: average_gir_percentage {
    type: average
    sql: ${players__statistics__gir_pct} ;;
    value_format: "##.##\%"
    }
  measure: average_gir_percentage_player_filter{
    type: average
    sql: ${players__statistics__gir_pct} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format: "##.##\%"
    }

  measure: average_driving_average {
    type: average
    sql: ${players__statistics__drive_avg} ;;
    value_format_name: "decimal_2"
  }
  measure: average_driving_average_player_fitler{
    type: average
    sql: ${players__statistics__drive_avg} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: average_hole_proximity_average {
    type: average
    sql: ${players__statistics__hole_proximity_avg} ;;
    value_format_name: "decimal_2"
  }
  measure: average_hole_proximity_average_player_filter{
    type: average
    sql: ${players__statistics__hole_proximity_avg} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: average_holes_per_eagle {
    type: average
    sql: ${players__statistics__holes_per_eagle} ;;
    value_format_name: "decimal_2"
  }
  measure: average_holes_per_eagle_player_filter{
    type: average
    sql: ${players__statistics__holes_per_eagle} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: average_putting_average {
    type: average
    sql: ${players__statistics__putt_avg} ;;
    value_format_name: "decimal_2"
  }
  measure: average_putting_average_player_fitler{
    type: average
    sql: ${players__statistics__putt_avg} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: average_sand_save_percentage {
    type: average
    sql: ${players__statistics__sand_saves_pct} ;;
    value_format: "##.##\%"
    }
  measure: average_sand_save_percentage_player_fitler{
    type: average
    sql: ${players__statistics__sand_saves_pct} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format: "##.##\%"
  }

  measure: average_scoring_average {
    type: average
    sql: ${players__statistics__scoring_avg} ;;
    value_format_name: "decimal_2"
  }
  measure: average_scoring_average_player_fitler{
    type: average
    sql: ${players__statistics__scoring_avg} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: average_scrambling_percentage {
    type: average
    sql: ${players__statistics__scrambling_pct} ;;
    value_format: "##.##\%"
    }
  measure: average_scrambling_percentage_player_fitler{
    type: average
    sql: ${players__statistics__scrambling_pct} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format: "##.##\%"
    }

  measure: average_total_driving {
    type: average
    sql: ${players__statistics__total_driving} ;;
    value_format_name: "decimal_2"
  }
  measure: average_total_driving_player_fitler{
    type: average
    sql: ${players__statistics__total_driving} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format_name: "decimal_2"
  }

  measure: total_earnings_sum {
    type: sum
    sql: ${TABLE}.players__statistics__earnings ;;
    value_format_name: usd_0
  }

  measure: count_top_ten_finishes {
    type: sum
    sql: ${TABLE}.players__statistics__top_10 ;;
  }

  measure: count_first_place {
    type: sum
    sql: ${TABLE}.players__statistics__first_place ;;
  }

  measure: hole_proximity_feet {
    type: average
    sql: ${hole_proximity} ;;
    value_format: "0.## \" ft\""

  }

  measure: hole_proximity_feet_player{
    type: average
    sql: ${hole_proximity} ;;
    filters: {
      field: group_yes_no
      value: "Yes"
    }
    value_format: "0.## \" ft\""
    }



}
