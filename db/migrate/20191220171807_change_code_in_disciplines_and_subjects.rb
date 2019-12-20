class ChangeCodeInDisciplinesAndSubjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :disciplines, :code
    add_column :disciplines, :code, :string
    remove_column :subjects, :code
    add_column :subjects, :code, :string
  end
end
