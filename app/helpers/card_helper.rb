module CardHelper
    def card_for(title, model, link, column_num, image = nil)
        Card.new(self, title, model, link, column_num, image).html
    end

    class Card
        def initialize(view, title, model, link, column_num, image)
            @view, @title, @model, @link, @column_num, @image = view, title, model, link, column_num, image
        end

        def html
            # Create col class div
                # Create card class div
                    # Create card-content class div
                        # Create title h4
                        # Create content {label}: {data}
                    # Create card-action
                        # Create link 
            content_tag(:div, card, class: "col s12 m#{12 / column_num}")
        end

        private

        attr_accessor :view, :title, :model, :column_num, :link, :image
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def card
            content = safe_join([card_content, card_action])
            if image.attached?
                content = safe_join([card_image, content])
            end
            content_tag(:div, content, class: "card")
        end

        def card_image
            image_content = image_tag(image)
            content_tag(:div, image_content, class: "card-image")
        end

        def card_content
            items = []
            items.push content_tag(:h4, title)
            model.each_pair do |label, value|
                if label == ""
                    items.push content_tag(:div, value.truncate(50))
                else
                    label_text = content_tag(:b, "#{label}:") 
                    items.push content_tag(:div, label_text + " " + value.truncate(50))
                end
                
            end
            content_tag(:div, safe_join(items), class: "card-content")
        end

        def card_action
            link_tag = link_to "View", link
            content_tag(:div, link_tag, class: "card-action")
        end

    end
end