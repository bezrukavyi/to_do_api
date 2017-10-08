module JsonMatcher
  class ParseSchema
    class << self
      include Rails.application.routes.url_helpers

      def call(schema_path, object_hash = {})
        set_instances(object_hash)
        eval(File.read(File.absolute_path("spec/schemas/#{schema_path}.rb")))
      end

      def set_instances(object_hash)
        object_hash.each do |name, value|
          instance_variable_set "@#{name}", value
        end
      end

      def clear(object_hash)
        object_hash.each do |name, _value|
          instance_variable_set "@#{name}", nil
        end
      end

      def date(object_date)
        object_date.to_json.delete('"')
      end

      def entity_class(entity)
        entity.class.name.underscore.pluralize.dasherize
      end

      def file(entity)
        [ENV['DOMAIN'], entity.file.url].join
      end
    end
  end
end
