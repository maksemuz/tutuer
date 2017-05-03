class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string :number
      t.string :wagon_kind

      t.timestamps
    end
  end
end
