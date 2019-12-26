class Journal < ApplicationRecord
  include PgSearch::Model

  include Filterable
  include Publishable

  JOURNALS_DOCUMENT_CODE = "03".freeze

  user_owned
    
  belongs_to :publisher, optional: true
  has_many :issues, dependent: :destroy
  has_and_belongs_to_many :subjects
  
  has_one_attached :cover

  # validates :title, presence: true, uniqueness: true
  # validates :about, presence: true
  # validates :coverageFrom, presence: true
  # validates :coverageTo, presence: true
  # validates :publisher, presence: true
  # validates :isbn, presence: true
  # validates :cover, presence: true

  multisearchable against: [:title, :about, :isbn, :keywords], if: :published?
  pg_search_scope :search_by_title, against: :title
  pg_search_scope :search_by_publisher, associated_against: {
    publisher: :name
  }
  
end
