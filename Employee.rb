require 'securerandom' 
require 'csv'
class Employee
    attr_accessor :first_name, :last_name, :age, :address, :salary, :id
    def initialize
        @id = SecureRandom.uuid
    end
    def get_info
        info_arry = Array.new
        puts "Enter your personal info : "
        puts "Enter your First Name"
        first_name = gets.chomp.to_s
        puts "Enter your Last Name"
        last_name = gets.chomp.to_s
        puts "Enter your Address"
        address = gets.chomp.to_s
        puts "Enter your Age"
        age = gets.chomp.to_i
        puts "Enter your salary"
        salary = gets.chomp.to_i
        info_arry.push(first_name,last_name,age,address,salary,@position,@id)
    end
    def  set_info data
        @first_name = data[0]
        @last_name = data[1]
        @age = data[2]
        @address = data[3]
        @salary = data[4]
        @position =data[5]
        @id=data[6]
    end
    def print_info
        puts "this is information user"
        puts "#{@first_name},#{@last_name},#{@age},#{@address},#{@salary},#{@position},#{@id}"
    end
    def save  data
        data.each { |element| 
            CSV.open('employee.csv','a+') do |file|
                file << ['fname','lname','age','address','salary','position','id'] if file.count.eql? 0 
                file << [element[0],element[1],element[2],element[3],element[4],element[5],element[6]]
            end
         }
         puts "************************** Thank you **************************"
    end

end