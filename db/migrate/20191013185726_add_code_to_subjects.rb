class AddCodeToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :code, :integer
  end
end
