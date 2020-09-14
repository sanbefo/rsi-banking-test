require_relative 'account'
require_relative 'bank'
require_relative 'record'
require 'Date'

bank_bbva = Bank.new('BBVA')
bank_santander = Bank.new('Santander')
bank_bankia = Bank.new('Bankia')

banks = []
banks << bank_bankia << bank_santander << bank_bbva

30.times do |i|
  account = Account.new(i, "user_#{i > 9 ? i : '0' + i.to_s}", rand(10000))
  banks[rand(3)].add_account(account)
end

def intra_bank_transfer(banks)
  bank = banks[rand(3)]
  sender = rand(bank.accounts.size)
  receiver = rand(bank.accounts.size)
  if receiver == sender && receiver > 0
    receiver = receiver - 1
  end
  sender_account = bank.accounts[sender]
  receiver_account = bank.accounts[receiver]
  transfer_amount = rand(2000)
  if transfer_amount < sender_account.amount
    sender_account.amount -= transfer_amount
    record = Record.new(true, 0, 0, transfer_amount, sender_account.id, receiver_account.id)
    bank.add_record(record)
  else
    puts 'amount wished to transfer is greater than the money inside the account, operation canceled'
  end
end

def inter_bank_transfer(index)
  puts "#{index} missing"
end

50.times do |i|
  rand() > 0.5 ? intra_bank_transfer(banks) : inter_bank_transfer(i)
end

puts "\n--------------------------------------------------------------------"
banks.each do |bank|
  puts "\n#{bank.name} ACCOUNTS"
  puts "Holder's name \tAmount"
  puts "--------------------------------------------------------------------"
  bank.accounts.each do |account|
    puts "#{account.holders_name} \t#{account.amount}€"
  end
  puts "\n#{bank.name} RECORDS"
  puts "Date \tCommission \tLimit \tAmount \tSender's id \tReceiver's id"
  bank.records.each do |record|
    puts "#{record.date.strftime("%m/%d/%Y")} \t#{record.commission}€ \t#{record.limit}€ \t#{record.amount}€ \t\t#{record.sender} \t#{record.receiver}"
  end
end
puts "--------------------------------------------------------------------"
