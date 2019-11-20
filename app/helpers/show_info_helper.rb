module ShowInfoHelper
    def show_info_for(model, fields)
        Info.new(self, model, fields)
    end

    class Info
        def initialize(view, model, fields)
            @view, @model, @fields = view, model, fields
        end

        def html
            content_tag(:div, info_list)
        end

        private

        attr_accessor :view, :model, :fields
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def info_list
            content_list = []
            fields.each do |field|
                label = content_tag(:label, field.humanize + ": ", class: "field-label")
                content = safe_join(label, model[field])
                content_list.push content_tag(:div, content)
            end
            return content_list
        end
    end
end