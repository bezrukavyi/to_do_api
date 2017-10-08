{
  'data' => @tasks.map do |task|
    call('api/v1/task/entity', task: task)['data']
  end
}
