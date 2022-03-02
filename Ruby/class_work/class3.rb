
#block
def display(x)
    x.call(3,4)
end

#fro single line block
# display {puts "Hello World"}

# =for multiline block
# display do |i|
#     puts "Hello"
#     puts "World"
#     puts i
# end

# Proc
# var = Proc.new do |x,y|
#     puts "x=#{x} and y = #{y}"
# end
# display(var)

lmda = ->(x,y){puts "x=#{x} and y = #{y}" }
display(lmda)