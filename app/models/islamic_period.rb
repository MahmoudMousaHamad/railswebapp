class IslamicPeriod < ApplicationRecord

    include Publishable

    has_many_attached :slideshow_photos
end
