class Map
    def initialize
        @map = []
    end
    def set(k,v)
        @map.each do |sub|
            if k == sub[0]
                sub[1] = v
                return
            end
        end
        @map<<[k,v]
    end
    def get(k)
        @map.each {|sub| return sub[1] if sub[0]==k}
        return nil
    end
    def delete(k)
        @map.each {|sub| return @map.delete(sub) if sub[0]==k}
    end
    def show
        # p "MAP:"
        @map.each {|sub| p sub}
    end
end

if __FILE__ == $PROGRAM_NAME
    m = Map.new
    m.set(:X,9)
    m.show
    m.set(:X,0)
    m.show
    m.set(:Y,2)
    m.show
    m.set(:Y,1)
    m.show
    m.delete(:Y)
    m.show
end
