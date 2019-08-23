class Book < ApplicationRecord
    belongs_to :publisher
    has_and_belongs_to_many :subjects

    has_one_attached :cover
    has_one_attached :pdf

    validates :title, presence: true, uniqueness: true
    validates_presence_of :about, :year, :author, :pages, :pdf, :cover, :publisher

    def self.search(search)
        if search 
          where('title LIKE :search OR about LIKE :search', search: "%#{search}%");
        else
          find(:all)
        end
    end
end
