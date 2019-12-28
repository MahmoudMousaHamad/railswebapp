class AddSupervisorNameAndUniversityNameAndCollegeNameToAcademicPapers < ActiveRecord::Migration[6.0]
  def change
    add_column :academic_papers, :supervisor_name, :string
    add_column :academic_papers, :university_name, :string
    add_column :academic_papers, :college_name, :string
  end
end
