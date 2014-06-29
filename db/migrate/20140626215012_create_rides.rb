class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string  :starting_point
      t.string  :destination
      t.belongs_to  :user

      t.timestamps
    end
  end
end
