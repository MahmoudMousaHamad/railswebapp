class Author < ApplicationRecord
    include Publishable

    has_and_belongs_to_many :academic_papers
    has_and_belongs_to_many :books
    has_and_belongs_to_many :journal_articles
    
    user_owned
end
