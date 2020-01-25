class AddUserIdToTables < ActiveRecord::Migration[6.0]
  AFFECTED_TABLES = [:authors, :books, :categories, :cities, :colleges, :conferences,
                     :country_references, :countries, :disciplines, :issues, :journals, :museums, :posts, 
                     :publishers, :scholarships, :schools, :sites, :subjects, :universities, :videos]
  def change
    AFFECTED_TABLES.each do |table|
      unless column_exists? table, :user_id
        add_column table, :user_id, :integer        
      end
      unless column_exists? table, :published
        add_column table, :published, :boolean
      end
    end
  end
end
