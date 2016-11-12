class Employee
    attr_reader :name
    
    def name=(name)
        if name == ""
            raise "Name can not be left blank"
        end
        @name = name
    end
    
    def initialize( name = "Anonymous")
        self.name = name
    end
    
    def print_name
        puts "Name: #{self.name}"
    end
        
end


class SalariedEmployee < Employee
    attr_reader :salary
    
    def initialize( name = "Anonymous", salary = 0.0 )
        super(name)
        self.salary = salary
    end
    
    def salary=(salary)
        if salary < 0
            raise "Salary can not be less than 0"
        end
        @salary = salary
    end
    
    def print_pay_stub
        print_name
        pay_for_period = (@salary/365.0) * 14
        formatted_pay = format("%0.2f", pay_for_period)
        puts "Pay this period: #{formatted_pay}"
    end
        
end

class HourlyEmployee < Employee
    
    def self.security_guard(name)
        HourlyEmployee.new(name, 19.25, 30)
    end
    
    def self.cashier(name)
        HourlyEmployee.new(name, 12.75, 25)
    end
    
    def self.cashier(name)
        HourlyEmployee.new(name, 10.50, 20)
    end
    
    
    attr_reader :hourly_wages, :hours_per_week
    
    def hourly_wages=(hourly_wages)
        if hourly_wages < 0
            raise "An hourly wage of #{hourly_wages} isn't valid!"
        end
        @hourly_wages = hourly_wages
    end
    
    def hours_per_week=(hours_per_week)
        if hours_per_week < 0
            raise "#{hours_per_week} hours per week isn't valid!"
        end
        @hours_per_week = hours_per_week
    end
    
    def initialize( name = "Anonymous", hourly_wages = 0.0, hours_per_week = 0.0 )
        super(name)
        self.hourly_wages = hourly_wages
        self.hours_per_week = hours_per_week
    end
    
    def print_pay_stub
        print_name
        pay_for_period = hourly_wages * hours_per_week * 2
        formatted_pay = format("Salary: %0.2f", pay_for_period)
        puts "Pay this period: #{formatted_pay}"
    end
        
end


employee01 = SalariedEmployee.new("Mister Mann", 85000)
employee01.print_pay_stub

jane = SalariedEmployee.new("Jane Doe", 50000)
jane.print_pay_stub

angela = HourlyEmployee.security_guard("Angela Matthews")
ivan = HourlyEmployee.cashier("Ivan Stokes")

angela.print_pay_stub
ivan.print_pay_stub
