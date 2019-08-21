class CreateSubjectsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subjects, :books do |t|
      t.index :subject_id
      t.index :book_id
    end
  end
end
