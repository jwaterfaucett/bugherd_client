module BugherdClient
  module Resources
    class Base
      include Her::Model
      include_root_in_json true
      parse_root_in_json true, format: :active_model_serializers

      def self.element_name(name)
        @_her_root_element = name
      end

      def self.parse(data)
        if data.respond_to?(:keys)
          data.keys.include?(root_element) ? data[root_element] : data
        else
          data
        end
      end
    end
  end
end