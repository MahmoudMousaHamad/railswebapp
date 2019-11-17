class Book < ApplicationRecord
    include PgSearch::Model

    include Filterable
    
    belongs_to :publisher
    belongs_to :book_collection, optional: true
    has_and_belongs_to_many :subjects

    has_one_attached :cover
    has_one_attached :pdf

    validates_presence_of :title, :about, :year, :author, :pages, :pdf, :cover, :publisher

    multisearchable against: [:title, :author, :about, :isbn, :keywords], if: :published?
    pg_search_scope :search_by_title, against: :title
    pg_search_scope :search_by_author, against: :author
    pg_search_scope :search_by_publisher, associated_against: {
        publisher: :name
    }


end
