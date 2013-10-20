module HydraAttributesHelper
  def default_hydra_attribute_value(hydra_attribute)
    if hydra_attribute.default_value.nil?
      'nil'
    else
      '"' + hydra_attribute.default_value + '"'
    end
  end
end