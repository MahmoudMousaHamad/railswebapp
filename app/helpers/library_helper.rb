module LibraryHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context
    def search_bar_for(name, params)
        SearchBar.new(self, name, params).html
    end

    def radio_button_for(name, value, selected, params)
        RadioButton.new(self, name, value, selected, params).html
    end

    def text_input_for(name, placeholder, type, params)
        TextInput.new(self, name, placeholder, type, params).html
    end

    def check_box_for(name, params)
        CheckBox.new(self, name, params).html
    end

    def get_library_link(request)
        return content_tag(:a, request.original_url, href: request.original_url)
    end

    $ON_CHANGE = "this.form.submit()"
    class SearchBar
        def initialize(view, name, params)
            @view, @name, @params = view, name, params
        end

        def html
            content_tag(:div, content)            
        end
        private
        attr_accessor :view, :name, :params
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def content
            content_tag(:input, nil, type: "text", name: name, value: params[name], required: true)
        end
    end

    class RadioButton
        def initialize(view, name, value, selected, params)
            @view, @name, @value, @selected, @params = 
            view, name, value, selected, params
        end
        def html
            content_tag(:div, content)            
        end
        private
        attr_accessor :view, :name, :value, :selected, :params
        delegate :radio_button_tag, :content_tag, :image_tag, :safe_join, to: :view
        def content
            input = radio_button_tag(name, nil, params[name] == value, value: value, onChange: $ON_CHANGE, selected: :selected)
            span = content_tag(:span, value.humanize)
            content_tag(:label, safe_join([input, span]))
        end
    end

    class TextInput
        def initialize(view, name, placeholder, type, params)
            @view, @name, @placeholder, @type, @params = 
            view, name, placeholder, type, params
        end
        def html
            content_tag(:div, content)            
        end
        private
        attr_accessor :view, :name, :placeholder, :type, :params
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def content
            content_tag(:input, nil, name: name, value: params[name], placeholder: placeholder, type: type)
        end
    end

    class CheckBox
        def initialize(view, name, params)
            @view, @name, @params = 
            view, name, params
        end
        def html
            content_tag(:span, content)            
        end
        private
        attr_accessor :view, :name, :params
        delegate :check_box_tag, :content_tag, :image_tag, :safe_join, to: :view

        def content
            check_box = check_box_tag(name, nil, params[name] == "on", onChange: $ON_CHANGE)
            span = content_tag(:span, name.humanize)
            content_tag(:label, safe_join([check_box, span]))
        end
    end

    class HtmlHelper
        def initialize(view, content)
            @view, @content = :view, :content
        end
        private
        attr_accessor :view, :content
    end
end
