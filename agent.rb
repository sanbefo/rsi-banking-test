require_relative 'account'
require_relative 'bank'
require_relative 'record'
require 'Date'

COMMISSION_FEE = 5
bank_bbva = Bank.new('BBVA')
bank_santander = Bank.new('Santander')
bank_bankia = Bank.new('Bankia')

banks = []
banks << bank_bankia << bank_santander << bank_bbva

30.times do |i|
  account = Account.new(i, "user_#{i > 9 ? i : '0' + i.to_s}", rand(10000))
  banks.sample.accounts << account
end

def intra_bank_transfer(i, banks)
  bank = banks.sample
  sample_accounts = bank.accounts.sample(2)
  sender_account = sample_accounts.first
  receiver_account = sample_accounts.last
  transfer_amount = rand(2000)
  if transfer_amount < sender_account.amount
    sender_account.amount -= transfer_amount
    receiver_account.amount += transfer_amount
    record = Record.new(i, true, 0, 0, transfer_amount, sender_account.id, receiver_account.id)
    bank.records << record
  else
    puts "Amount wished to transfer is greater than the money in the account. Operation #{i} canceled"
  end
end

def inter_bank_transfer(i, banks)
  sample_banks = banks.sample(2)
  sender_bank = sample_banks.first
  receiver_bank = sample_banks.last
  sender_account = sender_bank.accounts.sample
  receiver_account = receiver_bank.accounts.sample
  transfer_amount = rand(2000)
  if transfer_amount < sender_account.amount
    status = rand() > 0.3 ? true : false
    transfer_amount = status ? (transfer_amount > 1000 ? 1000 : transfer_amount) : 0
    record = Record.new(i, status, status ? COMMISSION_FEE : 0, 1000, transfer_amount, sender_account.id, receiver_account.id)
    sender_bank.records << record
    receiver_bank.records << record
    if status
      sender_account.amount -= transfer_amount - COMMISSION_FEE
      receiver_account.amount += transfer_amount
      receiver_bank.commissions += COMMISSION_FEE
    end
  else
    puts "Amount wished to transfer is greater than the money in the account. Operation #{i} canceled"
  end
end

50.times do |i|
  rand() > 0.5 ? intra_bank_transfer(i, banks) : inter_bank_transfer(i, banks)
end

puts "\n------------------------------------------------------------------------------------------"
puts "SIMULATION'S REPORT"
banks.each do |bank|
  puts "\n#{bank.name.upcase} ACCOUNTS"
  puts "Holder's name \tAmount"
  puts "------------------------------------------------------------------------------------------"
  bank.accounts.each do |account|
    puts "#{account.holders_name} \t#{account.amount}€"
  end
  puts "\n#{bank.name.upcase} RECORDS"
  puts "ID \tStatus \tDate \tCommission \tLimit \tAmount \tSender's id \tReceiver's id"
  bank.records.each do |record|
    puts "#{record.id} \t#{record.status.to_s.upcase} \t#{record.date.strftime("%m/%d/%Y")} \t#{record.commission}€ \t#{record.limit}€ \t#{record.amount}€ \t\t#{record.sender} \t#{record.receiver}"
  end

  puts "\n#{bank.name.upcase} COMMISSIONS: #{bank.commissions}"
end
puts "------------------------------------------------------------------------------------------"
