

#in progress

def hundreds(n)
  if n == 1
    p "one hundred"
  elsif n == 2
    p "two hundred" 
  elsif n == 3
    p "three hundred"
  elsif n == 4
    p "four hundred"
  elsif n == 5
    p "five hundred"
  elsif n == 6
    p "six hundred"
  elsif n == 7
    p "seven hundred"
  elsif n == 8
    p "eight hundred"
  elsif n == 9
    p "nine hundred"
  end
end

def strangers(n, b) 
  if n == 1 && b == 1
    p "eleven"
  elsif n == 1 && b == 2
    p "twelve" 
  elsif n == 1 && b == 3
    p "thirteen "
  elsif n == 1 && b == 4
    p "fourteen "
  elsif n == 1 && b == 5
    p "fifteen "
  elsif n == 1 && b == 6
    p "sixteen "
  elsif n == 1 && b == 7
    p "seventeen "
  elsif n == 1 && b == 8
    p "eighteen "
  elsif n == 1 && b == 9
    p "nineteen "
  end
end

def tens(n)
  if n == 1 
    p "ten"
  elsif n == 2
    p "twenty" 
  elsif n == 3
    p "thirty "
  elsif n == 4
    p "fourty "
  elsif n == 5
    p "fifty "
  elsif n == 6
    p "sixty "
  elsif n == 7
    p "seventy "
  elsif n == 8
    p "eighty "
  elsif n == 9
    p "ninety "
  end
end

def singles(n)
  case n 
  when 1
    p "one"
  when 2
    p "two" 
  when 3
    p "three"
  when 4
    p "four "
  when 5
    p "five"
  when 6
    p "six "
  when 7
    p "seven "
  when 8
    p "eight "
  when 9
    p "nine "
  end
end
[123]
def convert(num)
  num = num.to_s.split('').map{|e| e.to_i }
  b = []
  if num.length < 2
    num.map{|e| singles(e)}
  elsif num.length < 3
    if num[-1] == 0 
      b << tens(num[0])
    else
      strangers(num[0], num[1])
    end
  elsif num.length < 4 && num.length > 2
    hundreds(num[0])
    if num[-1] == 0 && num[-2] == 1
      tens(num[-2])
    elsif num[-2] == 0
      singles(num[-1])
    elsif num[-2] != 0 && num[-2] != 1
      tens(num[1])
      singles(num[-1])
    else 
      strangers(num[-2], num[-1]) 
    end
  end
end

convert(159)

