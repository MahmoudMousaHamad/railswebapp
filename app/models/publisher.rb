class Publisher < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  has_many :journals, dependent: :destroy
  has_many :books, dependent: :destroy
  
  validates :name, presence: true
end
