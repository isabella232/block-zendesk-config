# If necessary, uncomment the line below to include explore_source.
# include: "zendesk_analytics.model.lkml"

explore: ticket_comment_response_times {}

view: ticket_comment_response_times {
  derived_table: {
    explore_source: ticket {
      column: created_time { field: ticket_comment.created_raw }
      column: ticket_id { field: ticket.id }
      column: id { field: ticket_comment.id }
      column: body { field: ticket_comment.body }
      column: user_id { field: ticket_comment.user_id }
      column: is_agent { field: ticket_commenter.is_agent }

      derived_column: next_agent_response_time {
        sql:  IF(CASE WHEN LAG(is_agent IS TRUE,1) OVER (PARTITION BY ticket_id ORDER BY created_time ASC) IS NULL
        OR (LAG(is_agent IS TRUE,1) OVER (PARTITION BY ticket_id ORDER BY created_time ASC) IS TRUE AND is_agent IS FALSE)
        THEN 1
       ELSE 0
       END = 1,
       -- Can replace the first_value input with a "is_suppport_agent" flag after building DT
       FIRST_VALUE(CASE WHEN is_agent IS TRUE THEN created_time ELSE NULL END IGNORE NULLS) OVER (PARTITION BY ticket_id ORDER BY created_time ASC ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), NULL) ;;
      }
      derived_column: responding_agent_id {
        sql: IF(CASE WHEN LAG(is_agent IS TRUE,1) OVER (PARTITION BY ticket_id ORDER BY created_time ASC) IS NULL
        OR (LAG(is_agent IS TRUE,1) OVER (PARTITION BY ticket_id ORDER BY created_time ASC) IS TRUE AND is_agent IS FALSE)
        THEN 1
       ELSE 0
       END = 1,
       -- Can replace the first_value input with a "is_suppport_agent" flag after building DT
       FIRST_VALUE(CASE WHEN is_agent IS TRUE THEN user_id ELSE NULL END IGNORE NULLS) OVER (PARTITION BY ticket_id ORDER BY created_time ASC ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING), NULL) ;;
      }
      derived_column: first_response {
        sql: CASE WHEN ROW_NUMBER() OVER (PARTITION BY ticket_id ORDER BY created_time ASC) = 1 THEN TRUE ELSE FALSE END ;;
      }

      filters: {
        field: ticket_comment.public
        value: "Yes"
      }
    }
  }
  dimension_group: created {
    type: time
    sql: ${TABLE}.created_time ;;
  }
  dimension: ticket_id {
    type: number
  }
  dimension: id {
    type: number
    primary_key: yes
  }
  dimension: body {}
  dimension: user_id {
    type: number
  }
  dimension: is_agent {
    label: "Ticket Commenter Is Agent (Yes / No)"
    type: yesno
  }

  dimension_group: next_agent_response {
    type: time
    sql: ${TABLE}.next_agent_response_time ;;
  }

  dimension: response_time {
    type: number
    sql: ((UNIX_DATE(DATE(${next_agent_response_raw})) - UNIX_DATE(DATE(${created_raw}))) + 1)
  -((EXTRACT(WEEK FROM ${next_agent_response_raw}) - EXTRACT(WEEK FROM ${created_raw})) * 2)
  -(CASE WHEN EXTRACT(DAYOFWEEK FROM ${created_raw}) = 1 THEN 1 ELSE 0 END)
  -(CASE WHEN EXTRACT(DAYOFWEEK FROM ${next_agent_response_raw}) = 7 THEN 1 ELSE 0 END)

  +

  TIME_DIFF(TIME(${next_agent_response_raw}), TIME(${created_raw}), hour)/24
  ;;
  }

  dimension: responding_agent_id {
    type: number
    html: {{ value }} ;;
  }

  measure: average_response_time {
    type: average
    sql: ${response_time} ;;
    value_format_name: decimal_2
  }

  measure: median_response_time {
    type: median
    sql: ${response_time} ;;
    value_format_name: decimal_2
  }
}
