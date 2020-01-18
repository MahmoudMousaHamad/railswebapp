class UpdateForeignKeyForAcademicPapersAndSupervisors < ActiveRecord::Migration[6.0]
  def change
    # remove the old foreign_key
    remove_foreign_key :academic_papers, :supervisors

    # add the new foreign_key
    add_foreign_key :academic_papers, :supervisors, on_delete: :cascade
  end
end
