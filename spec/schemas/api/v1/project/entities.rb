{
  'data' => @projects.map do |project|
    {
      'id' => project.id.to_s,
      'type' => entity_class(project),
      'attributes' => {
        'title' => project.title,
        'complete-at' => date(project.complete_at)
      },
      'relationships' => {
        'tasks' => call('api/v1/relationships', relationships: project.tasks)
      }
    }
  end,
  'included' => @projects.map do |project|
    call('api/v1/task/entities', tasks: project.tasks)['data']
  end.flatten
}
