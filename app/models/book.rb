class Book < ApplicationRecord
    belongs_to :publisher
    has_and_belongs_to_many :subjects

    has_one_attached :cover
    has_one_attached :pdf

    validates :title, presence: true, uniqueness: true
    validates :about, presence: true
    validates :year, presence: true
    validates :author, presence: true
    validates :pages, presence: true
    validates :pdf, presence: true
    validates :cover, presence: true
    validates :publisher, presence: true

    def self.search(search)
        if search 
          where('title LIKE :search OR about LIKE :search', search: "%#{search}%");
        else
          find(:all)
        end
    end
end
