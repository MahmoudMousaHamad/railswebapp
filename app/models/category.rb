class Category < ApplicationRecord
    has_many :conferences
    has_many :scholarship
    user_owned
end
