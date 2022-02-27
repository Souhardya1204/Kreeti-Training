def calc(num1,num2,op)
    if(op=='+')
        return num1+num2
    elsif(op=='-')
        return num1-num2
    elsif(op=='*')
        return num1*num2
    elsif(op=='/')
        return num1/num2
    else
        return "Invalid input"
    end
end


#using case exp
def calc_switch(num1,num2,op)
    sum=nil
    case op
    when "+"
        sum=num1+num2
    when "-"
        sum=num1-num2
    when "*"
        sum=num1*num2
    when "/"
        sum=num1/num2
    else
        sum="Invalid operator"
    end
    sum
end

puts("Enter first number")
num1=gets.chomp().to_f
puts("Enter operator")
op=gets.chomp()
puts("Enter second number")
num2=gets.chomp().to_f
puts calc_switch(num1,num2,op)