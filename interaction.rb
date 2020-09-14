require_relative 'account'
require_relative 'bank'
require_relative 'record'
require 'Date'

bank_bbva = Bank.new('BBVA')
bank_santander = Bank.new('Santander')
bank_bankia = Bank.new('Bankia')

banks = []
banks << bank_bankia << bank_santander << bank_bbva

30.times do |index|
  account = Account.new("user_#{index}", rand(10000))
  banks[rand(3)].add_account(account)
end
