require 'securerandom' 
require 'csv'
class Employee
    attr_accessor :first_name, :last_name, :age, :address, :salary, :id
    def initialize
        @id = SecureRandom.uuid
    end
    def get_info
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
        info_hash = {"fname" =>first_name,"lname" =>last_name,"age" =>age,"address" =>address,"salary" =>salary,'id'=>@id}
    end
    def save_data  data,position
        puts "do you wnet save date y/n"
        ask = gets.chomp.to_s
        unless ask == 'y'
            raise   
        else
            CSV.open('employee.csv','a+') do |file|
                file << ['fname','lname','age','address','salary','position','id'] if file.count.eql? 0 
                file << [data['fname'],data['lname'],data['age'],data['address'],data['salary'],position,@id]
            end
            puts "************************** Thank you **************************"
        end
    end
    def  set_info data
        @first_name = data['fname']
        @last_name = data['lname']
        @age = data['age']
        @address = data['address']
        @salary = data['salary']
    end
    def print_info
        puts "this is information user"
        puts "#{@first_name},#{@last_name},#{@age},#{@address},#{@salary},#{@id}"
    end

end