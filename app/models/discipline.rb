class Discipline < ApplicationRecord
    include Publishable

    has_many :subjects, dependent: :destroy
    user_owned
    has_one_attached :photo

    validates :code, uniqueness: true
    validates :name, uniqueness: true
end
