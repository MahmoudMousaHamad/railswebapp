class BookCollection < ApplicationRecord
    has_many :books
    user_owned
end
