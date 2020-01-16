class DropSupervisorInAcademicPapers < ActiveRecord::Migration[6.0]
  def change
    remove_column :academic_papers, :supervisor_name
  end
end
