class Issue < ApplicationRecord
  include PgSearch::Model
  include Filterable

  user_owned
    
  belongs_to :journal
  has_one_attached :pdf

  # validates :number, presence: true
  # validates :year, presence: true
  # validates :pageFrom, presence: true
  # validates :pageTo, presence: true
  # validates :journal, presence: true
  # validates :pdf, presence: true

end
