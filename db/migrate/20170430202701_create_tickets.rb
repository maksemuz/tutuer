class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :source
      t.string :destination

      t.timestamps
    end
  end
end
