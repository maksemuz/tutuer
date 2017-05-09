class AddExtraPlacesToWagons < ActiveRecord::Migration[5.0]
  def change
    add_column :wagons, :side_upper_places, :integer, default: 10
    add_column :wagons, :side_lower_places, :integer, default: 10
    add_column :wagons, :seats, :integer, default: 10
    add_column :wagons, :type, :string, default: 'Coupe'
  end
end
