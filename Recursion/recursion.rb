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
               
    else
        
    end
end


p first_exponent(3, 2)