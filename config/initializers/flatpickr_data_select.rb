module ActionView
  module Helpers
      
    def set_locale   
       I18n.locale = extract_locale_from_uri   
    end 
    class FormBuilder
       def flatpickr_date_select(field, options = {}, html_options = {})
           raise 'unknown fields' unless @object.attributes.keys.include?(field.to_s)
           i18n_placeholder = I18n.t("activerecord.attributes.#{@object.class.name.underscore}.#{field}")
           placeholder = options.stringify_keys["placeholder"] || i18n_placeholder
           value = @object.attributes[field.to_s].to_s.to_time.strftime("%F") rescue ''

           @template.content_tag(:div, class: "input-group flatpicker_date_select") do
                text_field(field, value: value, class: "form-control flatpickr-input",
                    data: {input: ""}, placeholder: placeholder) +
                @template.content_tag(:span,
                    @template.content_tag(:span, "", class: "glyphicon glyphicon-calendar",
                        data: {toggle: "1"} ), class: "input-group-addon")+
                @template.content_tag(:span,
                    @template.content_tag(:span, "", class: "glyphicon glyphicon-remove",
                        data: {clear: "1"} ) ,class: "input-group-addon")
          end
       end
     end
   end
end