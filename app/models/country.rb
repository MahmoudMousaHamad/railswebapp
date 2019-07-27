class Country < ApplicationRecord

    has_many :cities, dependent: :destroy
    has_many :sites, dependent: :destroy

    has_many_attached :photos

    validates :name, uniqueness: true
    validates :about, presence: true
end
