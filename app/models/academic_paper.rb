class AcademicPaper < ApplicationRecord
    include PgSearch::Model
    multisearchable against: [:title, :author, :abstract, :keywords]
                    if: :published?

    has_and_belongs_to_many :subjects
end
