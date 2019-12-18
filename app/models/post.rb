class Post < ApplicationRecord
  include Filterable
  include Publishable

  user_owned
    
  belongs_to :country
  belongs_to :city
  has_one_attached :cover_photo

  paginates_per 5

end
