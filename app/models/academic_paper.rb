class AcademicPaper < ApplicationRecord
    include PgSearch::Model

    include Publishable

    ACADEMICPAPER_DOCUMENT_CODE = "01".freeze

    has_and_belongs_to_many :subjects
    has_and_belongs_to_many :authors
    belongs_to :supervisor, optional: true, dependent: :destroy
    
    has_one_attached :pdf

    user_owned

    multisearchable against: [:title, :author, :about, :keywords], if: :published?
    pg_search_scope :search_by_title, against: :title
    pg_search_scope :search_by_author, associated_against: {
        authors: :name
    }
    
    accepts_nested_attributes_for :authors, allow_destroy: true
    accepts_nested_attributes_for :supervisor, allow_destroy: true

    validates :subjects, presence: true
end
