class AddLibraryIdToAcademicPapersBooksAndJournals < ActiveRecord::Migration[6.0]
  def change
    add_column :academic_papers, :library_id, :string
    add_column :books, :library_id, :string
    add_column :journals, :library_id, :string
  end
end
