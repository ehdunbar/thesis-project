connection: "lookerdata_standard_sql"

# include all the views
include: "*.view"

datagroup: eric_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: eric_thesis_default_datagroup

explore: combined_rounds {
  label: "Tournament Information"
  join: combined_leaderboard {
    sql_on: ${combined_leaderboard.leaderboard__first_name} = ${combined_rounds.round__players__first_name} AND
    ${combined_leaderboard.leaderboard__last_name} = ${combined_rounds.round__players__last_name} AND
    ${combined_leaderboard.leaderboard__rounds__sequence} = ${combined_rounds.round__number} AND
    ${combined_leaderboard.seasons__year} = ${combined_rounds.seasons__year};;
    relationship: one_to_one
    }

  join: combined_hole_stats {
    sql_on: ${combined_hole_stats.rounds__courses__holes__number} =
      ${combined_rounds.round__players__course__holes__number} AND
        ${combined_hole_stats.rounds__number} = ${combined_rounds.round__number} AND
        ${combined_hole_stats.seasons__year} = ${combined_rounds.seasons__year};;
    relationship: one_to_one
    }
}

explore: player_statistics {
  label: "Player Information"
  join: player_rankings {
    sql_on: ${player_rankings.players__id} = ${player_statistics.players__id};;
    relationship: one_to_one
  }

  join: player_profiles {
    sql_on: ${player_profiles.players__id} = ${player_statistics.players__id} ;;
    relationship: one_to_one
  }
}

explore: schedule {}

explore: player_ranks {}
