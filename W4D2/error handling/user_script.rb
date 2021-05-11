require_relative 'super_useful'

begin
    puts "'five' == #{convert_to_int('five')}"
rescue => exception
    p exception
end

feed_me_a_fruit


sam = BestFriend.new('eeee', 5, 'egg')

sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
