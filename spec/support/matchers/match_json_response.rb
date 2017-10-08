require 'rspec/expectations'

RSpec::Matchers.define :match_json_response do |schema_path, object_hash|
  match do |response|
    @actual = JSON.parse(response.body)
    @expected = JsonMatcher::ParseSchema.call(schema_path, object_hash)
    JsonMatcher::ParseSchema.clear(object_hash)
    @actual == @expected
  end

  diffable
  attr_reader :actual, :expected
end
