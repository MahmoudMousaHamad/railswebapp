class Book < ApplicationRecord
    include PgSearch::Model

    include Filterable
    
    belongs_to :publisher
    belongs_to :book_collection, optional: true
    has_and_belongs_to_many :subjects
    has_and_belongs_to_many :authors

    has_one_attached :cover
    has_one_attached :pdf

    validates_presence_of :title, :about, :pages

    multisearchable against: [:title, :author, :about, :isbn, :keywords], if: :published?
    pg_search_scope :search_by_title, against: :title
    pg_search_scope :search_by_author, associated_against: {
        authors: :name
    }
    pg_search_scope :search_by_publisher, associated_against: {
        publisher: :name
    }


end
