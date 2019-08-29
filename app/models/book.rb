class Book < ApplicationRecord
    include Filterable
    
    belongs_to :publisher
    has_and_belongs_to_many :subjects

    has_one_attached :cover
    has_one_attached :pdf

    validates :title, presence: true, uniqueness: true
    validates_presence_of :about, :year, :author, :pages, :pdf, :cover, :publisher
end
