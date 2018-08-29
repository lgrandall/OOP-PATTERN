#Modules

module Subject 

  def add_observers(*new_observer)
    new_observer.each{|obsv| @observers << obsv}
  end 

  def show_observers
    p @observers 
  end

  def delete_observer(*old_observer)
    old_observer.each do |obsv|
      @observers.delete(obsv) if @observers.include?(obsv)
    end
  end

  def notify_observers
    @observers.each do |observer|
      observer.promotion_update(self)
    end
  end
end

module Reports 
  def promotion_report(promoted_epmloyee)
    puts "#{promoted_epmloyee.name} has recieved a promotion!\nPlease review following information:\nTitle: #{promoted_epmloyee.title?}\nSalary: #{promoted_epmloyee.salary?}\n #{@department} "
  end 
end 

########################################################

=begin
Accounting - This will be a higher level class that
essentially generates reports about what's going on in
the other classes.
=end

class Accounting
  include Reports 

  def initialize
    @department = 'Accounting'
  end 

  def promotion_update(promoted_epmloyee)
    promotion_report(promoted_epmloyee)
  end
  
end

class HR
  def initialize
    @department = "HR"
    @time_request = {}
  end

  def time_off(employee)
    @time_request[:employee.name] = employee.req_time?   
  end
end
########################################################

#Employee 

class Employee
  include Subject

  attr_reader :name, :emal, :start_date
  
  
  def initialize(name, email, title, salary, start_date)
    @name = name
    @email = email 
    @title = title 
    @salary= salary 
    @start_date = start_date 
    @observers = []
    @req_time = []
  end

  def salary?
    @salary
  end

  def title?
    @title
  end

  def req_time?
    @req_time
  end 

  def promotion(new_title, new_salary)
    @title = new_title
    @salary = new_salary
    notify_observers if @observers != []
  end
  
  def request_time_off(date)
    @req_time << date 
  end 


end

accounting = Accounting.new
louis = Employee.new("Louis", "test@test.com", "software engineer", 150000, Time.local(2018, ))
louis.add_observers(l)
louis.promotion('Senior Software Engineer', 200000)


