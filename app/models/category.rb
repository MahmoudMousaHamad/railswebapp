class Category < ApplicationRecord
    has_many :conferences
    has_many :scholarships
end
