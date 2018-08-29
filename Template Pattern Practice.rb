class Car
  def initialize(make)
    @make = make 
  end

  def what_am_i? 
    p "I am a #{make}"
  end
end 

class Engine 
  def initialize(type)
    @type = type 
  end 

  def rev
    p 'vroom vrooom vroooooooooom'
  end
end

class Benz < Car

  def initialize(make, engine = Engine.new('V8'))
    super(make)
    @type = "I'm a panda. You?"
    @engine = engine 
  end 

  def who_am_i? 
    p @type 
  end 

  def rev
    @engine.rev
  end
end

my_dream_car = Benz.new('1996')
my_dream_car.rev