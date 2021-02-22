class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :booked_from
      t.date :booked_to
      t.integer :total_cost
      t.references :user, null: false, foreign_key: true
      t.references :yurt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
