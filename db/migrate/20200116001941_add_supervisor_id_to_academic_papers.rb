class AddSupervisorIdToAcademicPapers < ActiveRecord::Migration[6.0]
  def change
    add_reference :academic_papers, :supervisor, null: true, foreign_key: true
  end
end
