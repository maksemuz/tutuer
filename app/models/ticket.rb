class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :source, class_name: 'RailwayStation', foreign_key: :source_id
  belongs_to :destination, class_name: 'RailwayStation', foreign_key: :destination_id

  after_create :send_buy_notificatiom
  after_destroy :send_drop_notification

  def route_name
    "#{source.title} - #{destination.title}"
  end

  private

  def send_buy_notificatiom
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_drop_notification
    TicketsMailer.drop_ticket(self.user, self).deliver_now
  end
end
