{
  'data' => {
    'id' => @attachment.id.to_s,
    'type' => entity_class(@attachment),
    'attributes' => {
      'name' => @attachment.name,
      'file' => {
        'file_name' => @attachment.file.file.original_filename,
        'url' => file(@attachment),
        'extension' => @attachment.file.file.extension
      },
      'task-id' => @attachment.task_id
    }
  }
}
