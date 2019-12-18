class Discipline < ApplicationRecord
    include Publishable
    
    has_many :subjects, dependent: :destroy

    user_owned

    has_one_attached :photo
end
