class Journal < ApplicationRecord
  belongs_to :publisher
  has_many :issues
  has_one_attached :cover
end
