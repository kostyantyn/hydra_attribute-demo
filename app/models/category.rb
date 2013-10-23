class Category < ActiveRecord::Base
  include HydraAttribute::ActiveRecord

  attr_accessible :name, :hydra_set_id

  class << self
    def search(params = {})
      params = params.stringify_keys
      hydra_attributes.inject(scoped) do |query, hydra_attribute|
        name = hydra_attribute.name

        case hydra_attribute.backend_type
        when 'integer', 'float', 'decimal'
          if params["#{name}__from"].present?
            if params["#{name}__to"].present?
              query = query.where(name => params["#{name}__from"]..params["#{name}__to"])
            else
              query = query.where(name => params["#{name}__from"])
            end
          end
          when 'boolean'
            if params[name].present?
              query = query.where(name => ActiveRecord::ConnectionAdapters::Column.value_to_boolean(params[name]))
            end
        else
          if params[name].present?
            query = query.where(name => params[name])
          end
        end
        query
      end
    end
  end
end
