{
  'data' => @attachments.map do |attachment|
    call('api/v1/attachment/entity', attachment: attachment)['data']
  end
}
