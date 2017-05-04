class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string :number
      t.string :wagon_kind
      t.integer :upper_places
      t.integer :lower_places

      t.timestamps
    end
  end
end
