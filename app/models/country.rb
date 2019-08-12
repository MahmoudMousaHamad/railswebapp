class Country < ApplicationRecord
    has_many :cities, dependent: :destroy
    has_many :sites, dependent: :destroy
    has_many :museums, dependent: :destroy
    has_many :conferences, dependent: :destroy
    has_many :scholarships, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :universities, dependent: :destroy

    has_many_attached :photos

    validates :name, uniqueness: true
    validates :about, presence: true
end
