# $global_variable = 10
# class Class1
#     var1 = 100
#     var2 = 200
#     def print_global
#         var1=150
#         puts "Global variable insde class1 is #$global_variable and constant is #{var1}"
#     end
    
# end

# puts "Enter age: "
# age = gets().chomp().to_i()
# case age
# when 0..2
#     puts "Baby"
# when 3..6
#     puts "Little child"
# when 7..12
#     puts "Child"
# when 13..18
#     puts "Youth"
# else 
#     puts "Adult"
    
# end

# for i in 0..5
#     if i<2
#         puts "Value of local var is #{i}"
#         redo
#     end
#     puts "Value of local var is #{i}"
# end
class Example
    def do_something
      banana = "variable"
  
      puts banana
      puts self.banana
    end
  
    def banana
      "method"
    end
  end
  
  Example.new.do_something
  
  # "variable"  => puts banana
  # "method"    => puts self.banana
