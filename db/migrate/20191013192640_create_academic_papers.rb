class CreateAcademicPapers < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_papers do |t|
      t.string :title
      t.string :author
      t.integer :publication_year
      t.string :type

      t.timestamps
    end
  end
end
