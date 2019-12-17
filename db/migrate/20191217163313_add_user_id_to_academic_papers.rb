class AddUserIdToAcademicPapers < ActiveRecord::Migration[6.0]
  def change
    add_column :academic_papers, :user_id, :integer
  end
end
