class Author < ApplicationRecord
    include Publishable

    has_and_belongs_to_many :academic_papers
    has_and_belongs_to_many :books
    user_owned
end
