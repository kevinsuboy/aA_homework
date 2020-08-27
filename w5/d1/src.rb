  class LRUCache
    def initialize(n)
        @map = Hash.new(false)
        @queue = Array.new
        @size = n
    end

    def count
      # returns number of elements currently in cache
      queue.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if map[el]
        queue.delete(el)
      end
      queue.push(el)
      map[el] = true
      remove! if self.count > size
    end

    def show
      # shows the items in the cache, with the LRU item first
      queue.each {|item| p item}
    end

    private
    # helper methods go here!
    attr_accessor :map, :queue, :size
    def remove!
        map.delete(queue.shift)
    end
  end

if __FILE__ == $PROGRAM_NAME
johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  p johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end