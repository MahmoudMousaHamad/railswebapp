class Journal < ApplicationRecord
  belongs_to :publisher
  has_many :issues
  has_and_belongs_to_many :subjects
  
  has_one_attached :cover

  validates :title, presence: true, uniqueness: true
  validates :about, presence: true
  validates :coverageFrom, presence: true
  validates :coverageTo, presence: true
  validates :publisher, presence: true
  validates :issn, presence: true
  validates :cover, presence: true

  def self.search(search)
    if search 
      where('title LIKE :search OR about LIKE :search', search: "%#{search}%");
    else
      find(:all)
    end
  end
end
