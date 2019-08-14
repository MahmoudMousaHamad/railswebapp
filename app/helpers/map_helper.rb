module MapHelper
    def location_map_for(lat, lng)
        Map.new(self, lat, lng).html
    end

    class Map
        def initialize(view, lat, lng)
            @view, @lat, @lng = view, lat, lng
        end

        def html
            content_tag(:div, nil, :data => {:lat => @lat, :lng => @lng}, class: 'location-map', id: "show-map-location")
        end

        private

        attr_accessor :view, :lat, :lng
        delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view
    end
end