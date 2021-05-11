# PHASE 2
def convert_to_int(str)
  Integer(str)
end

class CoffeeError < StandardError
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise CoffeeError.new if maybe_fruit == "coffee"
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts "#{maybe_fruit} is not a valid fruit. But I do enjoy coffee so you can try again"
    retry
  rescue => exception
    puts "cya"
  end
end  

class AgeError < ArgumentError
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise AgeError if yrs_known < 5
    raise NameError if name.length <=0
    raise PastTimeError if fav_pastime.length <=0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


