require 'Date'
class Record

  attr_accessor :id, :status, :date, :commission, :limit, :amount, :sender, :receiver

  def initialize(id, status, commission, limit, amount, sender, receiver)
    @id = id
    @status = status
    @date = Date.today
    @commission = commission
    @limit = limit
    @amount = amount
    @sender = sender
    @receiver = receiver
  end
end
