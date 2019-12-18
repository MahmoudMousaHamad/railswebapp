module Publishable
    extend ActiveSupport::Concern

    included do
        scope :published, -> { where(published: true) }
    end
end