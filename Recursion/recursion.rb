require 'byebug'
def range_iter(start, finish)
    arr = []
    
    (start...finish).each {|num| arr << num}
    arr
end

# p range_iter(1, 5)

def range_rec(start, finish)
    return [] if finish < start
    return [] if finish == start
    range_rec(start,finish - 1) + [finish - 1] 
end

# p range_rec(1, 5)

def first_exponent(b, n)
    return 1 if n == 0

    b * first_exponent(b, n - 1)
end

def second_exponent(b, n)
    return 1 if n == 0
    return b if n == 1

    if n.even?
        second_exponent(b, n / 2) * second_exponent(b, n / 2)
    else
        (b * (second_exponent(b, (n - 1) / 2))) * (b * (second_exponent(b, (n - 1) / 2)))
    end
end


# p first_exponent(3, 2)
# p second_exponent(2,2)

class Array
    def deep_dup
        # return dupe_arr if dupe_arr.length == self.length
        return self if self.length == 1
        dupe_arr = []

        self.each do |ele|
            if ele.is_a?(Array)
                dupe_arr += ele.deep_dup
            else
                dupe_arr << ele
            end
        end
        dupe_arr
    end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup

# robot_parts_copy[1] << "LEDs"
# p robot_parts[1]

def fibonacci_iter(n)
    return 0 if n == 1
    return 1 if n == 2
    array = [0, 1]
    i = 3
    while i <= n
        array << array[-1] + array[-2]
        i += 1
    end
    array[-1]
end

# p fibonacci_iter(5) 

def fibonacci_recur(n)
    return 0 if n == 1
    return 1 if n == 2

    fibonacci_recur(n - 1) + fibonacci_recur(n - 2)
end

def bsearch(array,target)
    return nil if array.first != target && array.length == 1
   
    mid = array.length / 2

    if array[mid] == target
        return mid
    elsif target < array[mid]
        return bsearch(array[0...mid],target)
    elsif bsearch(array[mid + 1..-1],target) == nil
        return nil
    else
        return mid + bsearch(array[mid + 1..-1],target) + 1
    end
end 

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return [] if array.length == 0
    return array if array.length == 1

    mid = array.length / 2

    first_half = merge_sort(array[0...mid])
    second_half = merge_sort(array[mid..-1])

    merge(first_half,second_half)
end

def merge(first_array,second_array)
    merged = []
    
    # if first_array.length > second_array.length
    #     max = first_array.length
    # else
    #     max = second_array.length
    # end

    # (0...max).each do |i|
    #     if first_array[i] == nil
    #         merged << second_array[i]
    #     else
    #         merged << first_array[i]
    #     end
    # end

    # sorted = []

    i = 0
    j = 0
    while i < first_array.length && j < second_array.length 
        if first_array[i] > second_array[j]
            merged << second_array[j]
            j += 1
        else
            merged << first_array[i]
            i += 1
        end
    end

    if i == first_array.length
        while j < second_array.length
            merged << second_array[j]
            j += 1
        end
    else
        while i < first_array.length
            merged << first_array[i]
            i += 1
        end
    end

    merged
end

# p merge_sort([2,1,5,9,7,3])

def subsets(array)

    return [] if array.length == 0

    new_array = []
    prev_array = subsets(array[0...array.length - 1])

    prev_array.each {|ele| new_array << ele}

    new_array << array
end

p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
