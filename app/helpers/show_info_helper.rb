module ShowInfoHelper
    def show_info_for(model, fields)
        Info.new(self, model, fields).html()
    end

    class Info
        def initialize(view, model, fields)
            @view, @model, @fields = view, model, fields
        end

        def html
            content_tag(:div, safe_join(info_list))
        end

        private

        attr_accessor :view, :model, :fields
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def info_list
            content_list = []
            fields.each do |field|
                if !model[field]
                    next
                end
                if model[field] != ""
                    string = "<label>" + field.to_s.humanize + ":</label> " + model[field].to_s.humanize
                    content = content_tag(:p, string.html_safe, class: "field-label")
                    content_list.push content_tag(:div, content)
                end
            end
            return content_list
        end
    end
end