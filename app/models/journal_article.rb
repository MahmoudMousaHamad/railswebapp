class JournalArticle < ApplicationRecord
  belongs_to :issue
  has_and_belongs_to_many :authors

  accepts_nested_attributes_for :authors

  has_one_attached :file
end
