class AddRailwayStationToTickets < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :tickets, :source
    add_belongs_to :tickets, :destination
  end
end
