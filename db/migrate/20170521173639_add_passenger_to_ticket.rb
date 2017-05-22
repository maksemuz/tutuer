class AddPassengerToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :passenger_fio, :string, default: 'FIO'
    add_column :tickets, :passport_data, :string, default: 'PASSPORT'
  end
end
