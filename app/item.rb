class Item
  attr_accessor :name, :price
  @@items = []

  def self.all
    @@items
  end

  def self.item_names
    self.all.map {|item| item.name}
  end #end item_names helper class method

  def self.find_by_name(name)
    self.all.find {|item| item.name == name}
  end #end find_by_name helper class method

  def initialize(name,price)
    @name = name
    @price = price
    self.class.all << self
  end
end
