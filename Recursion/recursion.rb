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

def first_exponenet(b, n)
    return 1 if n == 0

    b * first_exponenet(b, n - 1)
end

p first_exponenet(3, 2)