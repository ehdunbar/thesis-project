connection: "lookerdata_standard_sql"

# include all the views
include: "*.view"

datagroup: eric_thesis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: eric_thesis_default_datagroup

explore: combined_hole_stats {}

explore: masters_hole_stats {}

explore: masters_leaderboard {}

explore: masters_rounds {

  join: masters_leaderboard {
    sql_on: ${masters_leaderboard.leaderboard__first_name} = ${masters_rounds.round__players__first_name} AND
      ${masters_leaderboard.leaderboard__last_name} = ${masters_rounds.round__players__last_name} AND
      ${masters_leaderboard.leaderboard__rounds__sequence} = ${masters_rounds.round__number} AND
      ${masters_leaderboard.seasons__year} = ${masters_rounds.seasons__year};;
    relationship: one_to_one
  }


  join: masters_hole_stats {
    sql_on: ${masters_hole_stats.rounds__courses__holes__number} =
      ${masters_rounds.round__players__course__holes__number} AND
        ${masters_hole_stats.rounds__number} = ${masters_rounds.round__number} AND
        ${masters_hole_stats.seasons__year} = ${masters_rounds.seasons__year};;
    relationship: one_to_one

  }
}

explore: open_hole_stats {}

explore: open_leaderboard {}

explore: open_rounds {}

explore: pga_championship_hole_stats {}

explore: pga_championship_leaderboard {}

explore: pga_championship_rounds {}

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

explore: us_open_hole_stats {}

explore: us_open_leaderboard {}

explore: us_open_rounds {}

explore: player_ranks {}
