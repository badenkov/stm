class StateInput < SimpleForm::Inputs::Base
  def input
    label_method = :human_event
    value_method = :event
    current_state = template.content_tag(:div, template.content_tag(:span, "Текущий статус: #{object.human_state_name}", :class => "label label-info")  )

    out = @builder.collection_select(
      "#{attribute_name}_event", collection, value_method, label_method,
      input_options, input_html_options
    )

    (out << current_state).html_safe
  end

  def human_state_name
    template.content_tag(:span, object.human_state_name, class: 'label pull-right')
  end

  def input_options
    options = super
    options[:prompt] = 'Выберите новый статус...'
    options
  end

  private

  def collection
    object.send("#{attribute_name}_transitions")
  end
end
