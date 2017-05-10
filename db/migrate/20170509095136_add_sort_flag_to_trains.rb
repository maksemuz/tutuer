class AddSortFlagToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :head_sort, :boolean, default: true
  end
end
