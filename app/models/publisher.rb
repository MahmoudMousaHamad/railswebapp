class Publisher < ApplicationRecord
  include Filterable

  user_owned
    
  has_many :journals
  has_many :books
  
  validates :name, presence: true, uniqueness: true
  validates :about, presence: true
  validates :website, presence: true
end
