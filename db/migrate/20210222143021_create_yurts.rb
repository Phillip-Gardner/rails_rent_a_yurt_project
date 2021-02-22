class CreateYurts < ActiveRecord::Migration[6.0]
  def change
    create_table :yurts do |t|
      t.string :title
      t.text :description
      t.integer :max_capacity
      t.string :location
      t.integer :day_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
