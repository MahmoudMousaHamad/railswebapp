class Video < ApplicationRecord
  include Filterable

  user_owned
  
  belongs_to :country
  belongs_to :city
  belongs_to :site, optional: true
end
