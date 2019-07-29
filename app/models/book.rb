class Book < ApplicationRecord
    belongs_to :publisher
    has_one_attached :cover
    has_one_attached :pdf
end
