module HydraAttributesHelper
  def default_hydra_attribute_value(hydra_attribute)
    if hydra_attribute.default_value.nil?
      'nil'
    else
      '"' + hydra_attribute.default_value + '"'
    end
  end

  def hydra_attribute_fields_for(entity, form, submitted = false)
    entity.hydra_attribute_association.hydra_values.inject(''.html_safe) do |fields, (_,hydra_value)|
      name     = hydra_value.hydra_attribute.name
      disabled = !hydra_value.hydra_attribute.white_list

      fields + form_group(form, name, submitted) do
        case hydra_value.hydra_attribute.backend_type
        when 'string', 'integer', 'float', 'decimal'
          form.text_field name, class: 'form-control', disabled: disabled
        when 'text'
          form.text_area name, class: 'form-control', rows: 3, disabled: disabled
        when 'boolean'
          form.select name, options_for_select([['YES', true], ['NO', false]], hydra_value.value), {included_blank: false}, {class: 'form-control', disabled: disabled}
        when 'datetime'
          form.datetime_select name, {}, disabled: disabled
        else
          raise 'Unknown backend type'
        end
      end
    end
  end
end