class TicketsMailer < ApplicationMailer

  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вами куплен билет')
  end

  def drop_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вами куплен билет')
  end

end
