{
  'data' => {
    'id' => @resource.id.to_s,
    'type' => entity_class(@resource),
    'attributes' => {
      'email' => @resource.email,
      'provider' => @resource.provider,
      'uid' => @resource.uid
    }
  }
}
