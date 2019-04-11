view: ticket_comment {
  sql_table_name: zendesk.ticket_comment ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comment_author {
    type: string
    sql: CASE WHEN ${requester.id} = ${user_id} THEN 'Requester'
              WHEN ${assignee.id} = ${user_id} THEN 'Assignee'
              ELSE 'Other'
              END
    ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: created {
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
    sql: TIMESTAMP(DATETIME_ADD(DATETIME(${TABLE}.created), INTERVAL 779 DAY)) ;;
  }

  dimension: facebook_comment {
    type: yesno
    sql: ${TABLE}.facebook_comment ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: tweet {
    type: yesno
    sql: ${TABLE}.tweet ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: voice_comment {
    type: yesno
    sql: ${TABLE}.voice_comment ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user.id, user.custom_lead_or_contact_first_name, user.name, ticket.id]
  }
}
