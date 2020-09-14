class Bank

  attr_accessor :id, :name, :records, :accounts, :commissions

  def initialize(name)
    @name = name
    @accounts = []
    @records = []
    @commissions = 0
  end
end
