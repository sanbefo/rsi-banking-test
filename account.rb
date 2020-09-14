class Account

  attr_accessor :id, :holders_name, :amount

  def initialize(id, holders_name, amount)
    @id = id
    @holders_name = holders_name
    @amount = amount
  end

#   def initialize
#     @list = []
#   end

#   def add_item(item)
#     @list << item.capitalize
#     update_csv
#   end

#   def delete_item(item)
#     @list.delete_at(item)
#     update_csv
#   end

#   def update_item(index, item)
#     @list[index] = item + " "
#     update_csv
#   end

#   def create_csv
#     CSV.open("To Do's.csv","w")
#   end

#   def read_csv
#     @list = CSV.read("To Do's.csv", "r")
#     @list.flatten!
#   end

#   def update_csv
# #   @list.flatten!
#     CSV.open("To Do's.csv","w") do  |csv|
#       @list.each { |value|
#         csv << [value]
#       }
#     end
#   end

#   def manage_file
#     begin
#       read_csv
#     rescue
#       create_csv
#     end
#   end
end
