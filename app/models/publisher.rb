class Publisher < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  has_and_belongs_to_many :journals, dependent: :destroy
  has_and_belongs_to_many :books, dependent: :destroy
  
  validates :name, presence: true
end
