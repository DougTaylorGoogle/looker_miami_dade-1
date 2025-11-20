connection: "bigquery_public_data_looker"

include: "views/*.view.lkml"                # include all views in the views/ folder in this project

explore: student_master {
  view_name:  performance

  join: demographics {
    type: left_outer
    relationship: many_to_many
    sql_on: ${performance.student_id} = ${demographics.student_id};;
  }
  join: attendance{
    type: left_outer
    relationship: many_to_many
    sql_on: ${performance.student_id} = ${attendance.student_id};;
  }
}

