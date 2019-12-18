class Video < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
  
  belongs_to :country
  belongs_to :city
  belongs_to :site, optional: true
end
