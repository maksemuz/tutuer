class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :source, class_name: 'RailwayStation', foreign_key: :source_id
  belongs_to :destination, class_name: 'RailwayStation', foreign_key: :destination_id
end
