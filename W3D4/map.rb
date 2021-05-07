class Map
    def initialize
        @map = []
    end

    def set(k,v)
        not_in_map = @map.none? {|pair| pair[0] == k}
        if not_in_map
            @map.push([k,v])
        else
            @map.each do |pair| 
                if pair[0] == k
                    pair[1] = v
                    break
                end
            end
        end
    end

    def get(k)
        @map.each {|pair| return pair[1] if pair[0] == k}
    end

    def delete(k)
        @map.reject! {|pair| pair[0] == k}
    end

    def show
        str = "{"
        @map.each {|pair| str+=" '#{pair[0]}' => '#{pair[1]}';"}
        str[-2] = "" if str[-2] ==";"
        str[-1] = "" if str[-1] == ";"
        str[-1] == '\'' ? str+=" }" : str+="}"
        str
    end

end

map = Map.new
map.set("dog", "frog")
map.set("cat", "bat")
# map.set("ungo", "bungo")
# map.set("doggo", "froggo")
# map.set("rat", "shat")

map.set("dog", "rat")

map.delete("cat")
puts map.show