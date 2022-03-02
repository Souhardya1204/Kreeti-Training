class Customer
  @@no_of_customers=0
  def initialize(id=0,name="No name",addr=" No addr")
    @cust_id=id
    @cust_name=name
    @cust_addr = addr
    @@no_of_customers+=1
  end
  def display_details()
    puts "Customer id: #@cust_id"
    puts "Cusstomer name: #@cust_name"
    puts "Customer address: #@cust_addr"
  end

  def self.total_customers()
    puts "Total number of customers: #@@no_of_customers"
  end
  
  
end


cust1 = Customer.new("1","Reet","Kolkata")
cust1.display_details()
cust2 = Customer.new()
Customer.total_customers()
