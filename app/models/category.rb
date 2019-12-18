class Category < ApplicationRecord
    include Publishable
    
    has_many :conferences
    has_many :scholarship
    user_owned
end
