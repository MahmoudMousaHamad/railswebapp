class Discipline < ApplicationRecord
    include Publishable

    has_many :subjects, dependent: :destroy
    has_one_attached :photo
    user_owned

    validates :code, uniqueness: true
    validates :name, uniqueness: true
end
