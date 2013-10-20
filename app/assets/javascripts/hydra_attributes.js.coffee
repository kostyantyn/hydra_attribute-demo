$ ->
  # used in creation/updating hydra attribute
  defaultValue    = $('#hydra_attribute_default_value')
  setDefaultValue = $('#set_default_hydra_attribute_value')
  setDefaultValue.on 'click', ->
    defaultValue.attr('disabled', setDefaultValue.is(':not(:checked)'))