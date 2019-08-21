class CreateJournalsSubjectsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :journals, :subjects do |t|
      t.index [:journal_id, :subject_id]
      t.index [:subject_id, :journal_id]
    end
  end
end
