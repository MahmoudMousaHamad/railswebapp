class Discipline < ApplicationRecord
    has_many :subjects

    user_owned

    has_one_attached :photo
end
