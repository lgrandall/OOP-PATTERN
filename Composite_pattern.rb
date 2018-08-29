class Task
  attr_reader :name 
  def initialize(name)
    @name = name 
  end 

  def get_time_required
    0.0
  end
end

class AddDryIngredients < Task 

  def initialize
    super('Add dry ingredients')
  end 

  def get_time_required
    1.0 
  end 
end 

class MixIngredients < Task 

  def initialize
    super('Mx the ingredients')
  end 

  def get_time_required
    3.0 
  end 
end 

class CompositeTask < Task 
  def initialize(name)
    super(name)
    @sub_tasks = [] 
  end 

  def << sub_task
    @sub_tasks << sub_task 
  end 

  def delete_subtask(sub_task)
    @sub_tasks.delete(sub_task)
  end 

  def get_time_required
    time = 0
    @sub_tasks.each {|e| time += e.get_time_required}
    time 
  end 
end 

class PrepareBatter < CompositeTask
  def initialize 
    super('Prepare batter')
    PrepareBatter << MixIngredients.new
    PrepareBatter << AddDryIngredients.new
  end 
end 