class Issue < ApplicationRecord
  belongs_to :journal
  has_one_attached :pdf
end
