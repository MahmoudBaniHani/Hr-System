require_relative ('Manger')
require_relative ('Leader')
require_relative ('Junior')
require ('csv')

def read_file
    file_hash ={}
    CSV.foreach(("employee.csv"), headers: true, col_sep: ",") do |row|
        file_hash={'fname'=>row['fname'],'lname'=>row['lname'],'age'=>row['age'],'address'=>row['address'],'salary'=>row['salary'],'position'=>row['position']} 
    end 
    file_hash
end
begin
    puts "Enter your choice \n1-write file \n2-read file"
    choice = gets.chomp.to_i
    case choice
        when  1
            puts "Choice  enter your system : \n 1-Mangers\n 2-Leader\n 3-Junior"
            typy_obj = gets.chomp.to_i
            case typy_obj
                when 1
                    mange = Manger.new 
                    mange.print_benifit
                    mange.print_task
                    info_hash = mange.get_info
                    mange.save_data info_hash,'manger'
                when 2
                    leader = Leader.new
                    leader.print_benifit
                    leader.print_task
                    info_hash = leader.get_info
                    leader.save_data info_hash,'leader'
                when 3
                    junior = Junior.new
                    junior.print_benifit
                    junior.print_task
                    info_hash = junior.get_info
                    junior.save_data info_hash,'junior'
            end
        when 2 
            file_hash = read_file 
            case file_hash['position']
                when 'manger'
                    mange = Manger.new
                    mange.set_info file_hash
                    mange.print_info
                    mange.print_benifit
                    mange.print_task
                    mange.save_data file_hash,'manger'
                when 'leader'
                    leader = Leader.new
                    leader.set_info file_hash
                    leader.print_info
                    leader.print_benifit
                    leader.print_task
                    leader.save_data file_hash,'leader'
                when 'junior' 
                    junior = Junior.new
                    junior.set_info file_hash
                    junior.print_info
                    junior.print_benifit
                    junior.print_task
                    junior.save_data file_hash,'junior'            
            end
    end
    rescue Exception => e
        puts e.message
        retry
end