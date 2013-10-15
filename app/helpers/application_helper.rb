module ApplicationHelper
  def form_group(form, attribute, submitted = false, &block)
    errors    = form.object.errors
    has_error = errors.has_key?(attribute)

    if submitted && has_error
      label_title = errors[attribute].inject([]) do |messages, error|
        messages << errors.full_message(attribute, error)
      end
      label_title = label_title.to_sentence
    else
      label_title = nil
    end

    content_tag(:div, class: form_group_class(has_error, submitted)) do
      label = form.label(attribute, label_title, class: 'control-label')
      label + "\n".html_safe + capture(&block)
    end
  end

  def form_group_class(has_error = false, submitted = false)
    html_class = 'form-group'
    if submitted
      html_class += has_error ? ' has-error' : ' has-success'
    end
    html_class
  end
end
