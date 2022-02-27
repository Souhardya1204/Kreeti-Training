# puts("Enter first number:")
# num1=gets.chomp().to_f
# puts("Enter second number:")
# num2=gets.chomp().to_f
# sum=num1+num2
# puts("Sum of the two numbers is "+ sum.to_s)

#Array
# friends = Array["Reet","Subhajit","Avisek"]
# puts friends.length()
# puts friends.include? "Reets"
# print("\n")
# puts friends.reverse()
# print("\n")
# puts friends
# print("\n")
# puts friends.sort()

#Hashes
# days = {
#     1=>"sunday",
#     2=>"Monday",
#     3=>"tuesday",
#     4=>"wednesday"
# }

# puts days[2]

#Methods
# def sayhi(user="no name", age=-1)
#     puts("Hello "+ user + " , you are "+age.to_s)
# end

# sayhi("Reet", 25)


# #return and multiple return
# def cube(num)
#     return num*num*num,70
# end

# puts cube(3)[1]


# #if statement

# puts("Enter a time: ")
# time = gets.chomp().to_i
# if(time>=6 and time<12)
#     puts "Good morning"
# elsif(time==12)
#     puts "Good noon"
# elsif(time>12 and time<18)
#     puts "Good Afternoon"
# else
#     puts "Good night"
# end

def max_three(a,b,c)
    if (a>=b and a>=c)
        return a
    elsif (b>=a and b>=c)
        return b
    else 
        return c
    end
end
puts("Enter 3 number : ")
num = gets.chomp().split().map(&:to_i)
max = max_three(num[0],num[1],num[2])
puts(max.to_s+" is the largest")

