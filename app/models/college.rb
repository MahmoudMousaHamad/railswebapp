class College < ApplicationRecord
  belongs_to :university
  has_many :schools
end
