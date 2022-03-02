# array1=[1,2,3]

# array1.each do |num|
#     puts num+5
# end

# array1.each_with_index do |num,index|
#     puts "#{index}:#{num}"
# end
module Decimal
    RED="12113011"
    def self.getColorCode
        return "code is #{RED}"
    end
    
end

puts Decimal.getColorCode
puts Decimal::RED

class Emp
    include Decimal
    def a1
        puts "Emp 1 #{Decimal::RED}"
    end
    
end

class Manager
    include Decimal

end

e1 = Emp.new
e1.a1