require_relative 'account'
require_relative 'bank'
require_relative 'record'
require 'rspec/autorun'

describe Bank do
  it 'bank accounts are 0 when bank is created' do
    bank = Bank.new('BBVA')

    expect(bank.accounts.size).to eq(0)
  end

  it 'bank accounts are 1 when account is created' do
    bank = Bank.new('BBVA')
    account = Account.new(1, 'test', rand(10000))
    bank.accounts << account

    expect(bank.accounts.size).to eq(1)
  end

  it 'bank records are 1 when record is created, bank has 2 accounts' do
    bank = Bank.new('BBVA')
    account1 = Account.new(1, 'test1', 10000)
    account2 = Account.new(2, 'test2', 10000)
    bank.accounts << account1 << account2

    record = Record.new(1, true, 0, 0, 500, 1, 2)
    bank.accounts.first.amount -= 500
    bank.accounts.last.amount += 500
    bank.records << record

    expect(bank.records.size).to eq(1)
  end
end
