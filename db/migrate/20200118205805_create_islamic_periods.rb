class CreateIslamicPeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :islamic_periods do |t|
      t.string :name
      t.text :about
      t.integer :start_year
      t.integer :end_year

      t.timestamps
    end
  end
end
