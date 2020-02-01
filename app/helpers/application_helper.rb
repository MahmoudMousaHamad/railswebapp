module ApplicationHelper
    def get_image_safe_url(image, style_class)
        if image.attached?
            return image_tag url_for(image), class: style_class
        else
            return image_tag url_for("/assets/no-thumb.jpg"), class: style_class           
        end
    end

    def title(page_title)
        content_for :title, page_title.to_s
    end
end
