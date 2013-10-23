$ ->
  # used in creation/updating hydra attribute
  defaultValue    = $('#hydra_attribute_default_value')
  setDefaultValue = $('#set_default_hydra_attribute_value')
  setDefaultValue.on 'click', ->
    defaultValue.attr('disabled', setDefaultValue.is(':not(:checked)'))

  # enable search filter
  $('[data-enable-filter=true]').on 'click', (e) ->
    element = $(e.target)
    if element.data('numbered')
      $('#' + element.data('name') + '__from').attr('disabled', element.is(':not(:checked)'))
      $('#' + element.data('name') + '__to').attr('disabled', element.is(':not(:checked)'))
    else
      $('#' + element.data('name')).attr('disabled', element.is(':not(:checked)'))
