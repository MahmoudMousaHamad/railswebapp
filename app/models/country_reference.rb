class CountryReference < ApplicationRecord
    belongs_to :country

    user_owned
end
