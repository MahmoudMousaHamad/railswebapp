class BookCollection < ApplicationRecord
    include Publishable
    
    has_many :books, dependent: :destroy
    user_owned
end
