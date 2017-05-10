class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.integer :number
      t.integer :upper_places, default: 10
      t.integer :lower_places, default: 10

      t.timestamps
    end
  end
end
