class Account

  attr_accessor :id, :holders_name, :amount

  def initialize(id, holders_name, amount)
    @id = id
    @holders_name = holders_name
    @amount = amount
  end
end
