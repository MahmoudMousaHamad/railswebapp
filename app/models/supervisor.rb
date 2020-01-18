class Supervisor < ApplicationRecord
    include Publishable
    
    has_many :academic_papers
    user_owned
end
