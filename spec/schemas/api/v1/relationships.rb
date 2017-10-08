{
  'data' => @relationships.map do |entity|
    {
      'id' => entity.id.to_s,
      'type' => entity_class(entity)
    }
  end
}
