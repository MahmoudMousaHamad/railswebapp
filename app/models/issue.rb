class Issue < ApplicationRecord
  include PgSearch::Model
  include Filterable
  include Publishable

  user_owned
    
  belongs_to :journal
  has_many :journal_articles

end
