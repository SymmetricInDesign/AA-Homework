fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def find_longest_fish_n_squared(fish)
    longest_fish = nil
    fish.each_with_index do |fish1, i|
        longest = true
        fish.each_with_index do |fish2, j|
            if fish2.length > fish1.length 
                longest = false
            end
        end
        longest_fish = fish1 if longest
    end
    longest_fish
end

def find_longest_fish_n_log_n(fish)
    sorted_fish = fish.merge_sort {|n,m| n.length <=>m.length}
    p sorted_fish
    sorted_fish[-1]
end


class Array
  
    def merge_sort(&prc)
      prc ||= Proc.new{|n,m| n<=>m}
      return [] if self.length <1
      return self if self.length == 1
      mid_idx = self.length/2
      left = self[0...mid_idx]
      right = self[mid_idx..-1]
      Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
    end
  
    private
    def self.merge(left, right, &prc)
      prc ||= Proc.new{|n,m| n<=>m}
      right.each_with_index do |to_be_merged, i|
        merged = false
        left.each_with_index do |el, j|
          if prc.call(to_be_merged, el) == -1
            left.insert(j, to_be_merged)
            merged=true
            break
          end
  
        end
        left << to_be_merged if !merged
      end
      left
    end
end


def find_longest_fish_n(fish)
    longest = fish[0]
    fish.each do |fish|
        longest = fish if fish.length > longest.length
    end
    longest
end

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index {|tile, idx| return idx if tile == direction}
end
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {}
tiles_array.each_with_index {|tile, idx| tiles_hash[tile] = idx}


def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
end
    
p fast_dance("right-down", tiles_hash)
# p find_longest_fish_n(fish)