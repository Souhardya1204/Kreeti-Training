puts("Enter the base number: ")
b=gets.chomp().to_f
puts("Enter the exponent: ")
e=gets.chomp().to_f

def power(b,e)
    sum=1
    for i in 1..e do
        sum=sum*b
    end
    return sum
end

puts power(b,e)
