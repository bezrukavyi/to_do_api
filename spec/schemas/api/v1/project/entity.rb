{
  'data' => {
    'id' => @project.id.to_s,
    'type' => entity_class(@project),
    'attributes' => {
      'title' => @project.title,
      'complete-at' => date(@project.complete_at)
    },
    'relationships' => {
      'tasks' => call('api/v1/relationships', relationships: @project.tasks)
    }
  }
}
