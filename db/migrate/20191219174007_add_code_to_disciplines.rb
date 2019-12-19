class AddCodeToDisciplines < ActiveRecord::Migration[6.0]
  def change
    add_column :disciplines, :code, :integer
  end
end
