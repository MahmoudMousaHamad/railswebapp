class Discipline < ApplicationRecord
    has_many :subjects

    has_one_attached :photo
end
