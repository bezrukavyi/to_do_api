{
  'data' => {
    'id' => @task.id.to_s,
    'type' => entity_class(@task),
    'attributes' => {
      'title' => @task.title,
      'position' => @task.position,
      'checked' => @task.checked,
      'complete-at' => date(@task.complete_at),
      'project-id' => @task.project_id,
    }
  }
}
