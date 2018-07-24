view: combined_hole_stats {

  derived_table: {
    sql: SELECT * FROM golf_stats.Masters_Hole_Stats
        UNION ALL
        SELECT * EXCEPT(end_date, start_date) FROM golf_stats.Open_Hole_Stats
        UNION ALL
        SELECT * EXCEPT(end_date, start_date) FROM golf_stats.PGA_Championship_Hole_Stats
        UNION ALL
        SELECT * EXCEPT(end_date, start_date) FROM golf_stats.US_Open_Hole_Stats
        ;;
  }

  dimension: rounds_course_par {
    type: number
    sql: ${TABLE}.rounds__courses__par ;;
  }




#   SELECT * FROM golf_stats.Masters_Leaderboard
#         UNION ALL
#         SELECT *  FROM golf_stats.Open_Leaderboard
#         UNION ALL
#         SELECT *  FROM golf_stats.PGA_Championship_Leaderboard
#         UNION ALL
#         SELECT *  FROM golf_stats.US_Open_Leaderboard

# SELECT * EXCEPT(round__players__course__holes__description) FROM golf_stats.Masters_Rounds
#         UNION ALL
#         SELECT *  FROM golf_stats.Open_Rounds
#         UNION ALL
#         SELECT *  FROM golf_stats.PGA_Championship_Rounds
#         UNION ALL
#         SELECT * EXCEPT(round__status) FROM golf_stats.US_Open_Rounds

}
