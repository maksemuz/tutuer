class AddSortFlagToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :sort_flag, :boolean, default: true
  end
end
