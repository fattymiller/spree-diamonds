Spree::Product.class_eval do
  attr_accessible :is_in_usd, :unconverted_price
  delegate_belongs_to :master, :is_in_usd
  
  def unconverted_price=(unconverted)
    self.master.price = unconverted
  end
  def unconverted_price
    self.master[:price]
  end
end
