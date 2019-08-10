class School < ApplicationRecord
  belongs_to :college
  belongs_to :university
end
