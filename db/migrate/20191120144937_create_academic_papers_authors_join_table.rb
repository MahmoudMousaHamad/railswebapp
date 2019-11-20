class CreateAcademicPapersAuthorsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :academic_papers, :authors do |t|
      t.index :author_id, name: "index_academic_papers_authors_on_paper_id_and_author_id"
      t.index :academic_paper_id, name: "index_academic_papers_authors_on_author_id_and_paper_id"
    end
  end
end
