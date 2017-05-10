class AddSortFlagToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :sort_ascendance, :boolean, default: true
  end
end
