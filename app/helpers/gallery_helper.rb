module GalleryHelper
    def gallery_for(images)
        Gallery.new(self, images).html if images
    end

    class Gallery
        def initialize(view, images)
            @view, @images = view, images
        end

        def html
            content_tag(:div, grid, class: 'gallery row')
        end

        private

        attr_accessor :view, :images
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

        def grid
            content_tag(:div, safe_join(pictures), class: 'grid content')
        end

        def pictures
            pictures = []
            images.each do |image|
                pictures.push content_tag(:picture, image_tag(image, style: 'width=100%', class: 'materialboxed', width: "100%"))
            end
            return pictures
        end
    end
end