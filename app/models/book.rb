class Book < ApplicationRecord
    include PgSearch::Model

    include Filterable
    include Publishable

    BOOK_DOCUMENT_CODE = "02".freeze

    user_owned
    
    belongs_to :publisher, optional: true
    has_and_belongs_to_many :subjects
    has_and_belongs_to_many :authors

    has_one_attached :cover
    has_one_attached :pdf

    validates_presence_of :title

    multisearchable against: [:title, :author, :about, :isbn, :keywords], if: :published?
    pg_search_scope :search_by_title, against: :title
    pg_search_scope :search_by_author, associated_against: {
        authors: :name
    }
    pg_search_scope :search_by_publisher, associated_against: {
        publisher: :name
    }


end
