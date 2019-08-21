class Subject < ApplicationRecord
  belongs_to :discipline
  has_and_belongs_to_many :books
  has_and_belongs_to_many :journals
end
