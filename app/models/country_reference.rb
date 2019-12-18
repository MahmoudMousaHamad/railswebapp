class CountryReference < ApplicationRecord
    belongs_to :country
    include Publishable

    user_owned
end
