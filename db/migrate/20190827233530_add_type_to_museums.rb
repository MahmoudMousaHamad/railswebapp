class AddTypeToMuseums < ActiveRecord::Migration[6.0]
  def change
    add_column :museums, :type, :string
  end
end
