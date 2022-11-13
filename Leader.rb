require_relative ('Employee')
class Leader < Employee
    def initialize 
        @position ="Leader"
        super
    end
    def print_benifit
        puts "Leader - Benefits"
        puts "1-Competitive Salary\n2-Yearly Bouns\n3-Family Medical insurance"
    end
    def print_task
        puts "Leader - Job Description"
        puts "1-Handles Team members\n2-Team meeting\n3-Updates Managers"
    end 
end