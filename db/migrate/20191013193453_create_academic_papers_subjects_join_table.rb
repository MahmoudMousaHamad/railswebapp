class CreateAcademicPapersSubjectsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :academic_papers, :subjects do |t|
      t.index :subject_id, name: "index_academic_papers_subjects_on_paper_id_and_subject_id"
      t.index :academic_paper_id, name: "index_academic_papers_subjects_on_subject_id_and_paper_id"
    end
  end
end
