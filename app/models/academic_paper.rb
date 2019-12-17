class AcademicPaper < ApplicationRecord
    include PgSearch::Model

    has_and_belongs_to_many :subjects
    has_and_belongs_to_many :authors
    has_one_attached :pdf

    user_owned

    multisearchable against: [:title, :author, :about, :keywords], if: :published?
    pg_search_scope :search_by_title, against: :title
    pg_search_scope :search_by_author, associated_against: {
        authors: :name
    }

    accepts_nested_attributes_for :subjects
    accepts_nested_attributes_for :authors

end
