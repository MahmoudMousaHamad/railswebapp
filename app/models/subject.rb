class Subject < ApplicationRecord
  include Filterable
    
  belongs_to :discipline
  has_and_belongs_to_many :books
  has_and_belongs_to_many :journals
  has_and_belongs_to_many :academic_papers
end
