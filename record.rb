class Record

  attr_accessor :id, :status, :date

  def print_name
    puts "hola"
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
