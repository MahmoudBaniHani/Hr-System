require_relative ('Manger')
require_relative ('Leader')
require_relative ('Junior')
require_relative ('Employee')
require ('csv')

def read_file
    file_hash ={}
    emp =Array.new
    CSV.foreach(("employee.csv"), headers: true, col_sep: ",") do |row|
        emp.push([row[0],row[1],row[2],row[3],row[4],row[5],row[6]])
        # puts row['id']
        # file_hash={'fname'=>row['fname'],'lname'=>row['lname'],'age'=>row['age'],'address'=>row['address'],'salary'=>row['salary'],'position'=>row['position']} 
        file_hash={'id'=>row} 
    end 
    # file_hash
    emp
end
begin
    puts "Enter your choice \n1-write file \n2-read file"
    choice = gets.chomp.to_i
    condition = false
    employee = Array.new
    emp = Employee.new
    case choice   
        when  1
            until condition
                puts "Choice  enter your system : \n 1-Mangers\n 2-Leader\n 3-Junior"
                typy_obj = gets.chomp.to_i
                case typy_obj
                    when 1
                        mange = Manger.new 
                        mange.print_benifit
                        mange.print_task
                        employee.push(mange.get_info)
                    when 2
                        leader = Leader.new
                        leader.print_benifit
                        leader.print_task
                        employee.push(leader.get_info)
                    when 3
                        junior = Junior.new
                        junior.print_benifit
                        junior.print_task
                        employee.push(junior.get_info)
                end
                puts "do you wnet save date y/n"
                ask = gets.chomp.to_s
                unless ask == 'y'
                    condition = false
                else
                        emp.save employee 
                        condition = true
                end
            end  
        when 2 
            employees= read_file
            employees.each do |element|
                case element[5]
                    when "Manger"
                        mange = Manger.new
                        mange.set_info element
                        mange.print_info
                        mange.print_benifit
                        mange.print_task
                    when 'Leader'
                        leader = Leader.new
                        leader.set_info element
                        leader.print_info
                        leader.print_benifit
                        leader.print_task
                    when 'Junior' 
                        junior = Junior.new
                        junior.set_info element
                        junior.print_info
                        junior.print_benifit
                        junior.print_task          
                end  
            end
            emp.save employees
    end
    rescue Exception => e
        puts e.message
        retry
end