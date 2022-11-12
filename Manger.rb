require_relative ('Employee')
class Manger < Employee
    # def initialize
    #     super
    # end
    def print_benifit
        puts "Manager - Benefits"
        puts "1-High Salary\n2-High Raise\n3-Premium Medical insurance"
    end
    def print_task
        puts "Manger - Job Description"
        puts "1-Handles Mangement tasks\n2-Board Meeting\n3-Updates Owner"
    end
end