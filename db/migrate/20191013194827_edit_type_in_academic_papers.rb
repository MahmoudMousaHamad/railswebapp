class EditTypeInAcademicPapers < ActiveRecord::Migration[6.0]
  def change
    remove_column :academic_papers, :type
    add_column :academic_papers, :paper_type, :string
  end
end
