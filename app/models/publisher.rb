class Publisher < ApplicationRecord
  has_many :journals
  has_many :books
  
end
