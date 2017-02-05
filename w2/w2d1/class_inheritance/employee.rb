# Eployee class
class Employee

  attr_reader :salary

  def initialize(name, title , salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(mul)
    @salary * mul
  end

end


class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(mul)
    return @salary*mul unless self.class == Manager
    total = 0
    @employees.each do |employee|
      if employee.class == Manager
        total += employee.salary * mul
      end
    end
    @employees.inject(total) {|salary, employee| salary + employee.bonus(mul)}
  end
end
