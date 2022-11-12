require_relative ('Employee')
class Junior < Employee
    def print_benifit
        puts "Junior - Benefits"
        puts "1-Good Salary\n2-Medical Insurance"
    end
    def print_task
        puts "Junior - Job Description"
        puts "1-Handle daily tasks\n2-updates lead"
    end
end