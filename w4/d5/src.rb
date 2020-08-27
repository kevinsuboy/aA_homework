require 'byebug'
def sluggish_octopus(arr)
    res = ""
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            res = arr[i] if arr[i] > arr[j]
        end
    end
    return res
end

def dominant_octopus(arr)
    merge_sort(arr)[0]
end
def merge_sort(arr)
    return [] unless arr
    return arr if arr.length <= 1
    m = (arr.length-1)/2
    l = merge_sort(arr[0..m])
    r = merge_sort(arr[m+1..-1])
    merge(l,r)
end
def merge(arr1,arr2)
    res = []
    while !arr1.empty? && !arr2.empty?
        if arr1[0].length > arr2[0].length
            res << arr1.shift()
        else
            res << arr2.shift()
        end
    end
    res + arr1 + arr2
end
def clever_octopus(arr)
    res = ""
    arr.each{|a| res = a if a.length > res.length}
    res
end
# --------------
def slow_dance(dir,arr)
    arr.each_with_index {|a,i| return i if dir==a}
end
def fast_dance(dir,tiles)
    tiles[dir]
end
if __FILE__ == $PROGRAM_NAME
    arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    # => "fiiiissshhhhhh"
    # t1 = Time.now
    # p sluggish_octopus(arr)
    # t2 = Time.now
    # p t2-t1
    #
    # t1 = Time.now
    # p dominant_octopus(arr)
    # t2 = Time.now
    # p t2-t1
    #
    # t1 = Time.now
    # p clever_octopus(arr)
    # t2 = Time.now
    # p t2-t1
    # # -------------
    tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
    hash = {}
    tiles_array.each_with_index {|a,i| hash[a]=i}
    
    t1 = Time.now
    p slow_dance("up",tiles_array)
    t2 = Time.now
    p t2-t1
    t1 = Time.now
    p slow_dance("right-down",tiles_array)
    t2 = Time.now
    p t2-t1

    t1 = Time.now
    p fast_dance("up",hash)
    t2 = Time.now
    p t2-t1
    t1 = Time.now
    p fast_dance("right-down",hash)
    t2 = Time.now
    p t2-t1

end
