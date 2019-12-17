class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.user_owned
    belongs_to :user
  end
end
