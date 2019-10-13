class Book < ApplicationRecord
    include Filterable
    
    belongs_to :publisher
    belongs_to :book_collection, optional: true
    has_and_belongs_to_many :subjects

    has_one_attached :cover
    has_one_attached :pdf

    validates_presence_of :title, :about, :year, :author, :pages, :pdf, :cover, :publisher
end
