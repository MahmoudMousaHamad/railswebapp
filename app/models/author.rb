class Author < ApplicationRecord
    has_many :academic_papers
    has_many :books
end
