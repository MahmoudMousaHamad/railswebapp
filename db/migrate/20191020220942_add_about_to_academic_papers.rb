class AddAboutToAcademicPapers < ActiveRecord::Migration[6.0]
  def change
    add_column :academic_papers, :about, :text
  end
end
