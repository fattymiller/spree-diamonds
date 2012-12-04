Spree::Product.class_eval do
  attr_accessible :is_in_usd, :unconverted_price
  delegate_belongs_to :master, :is_in_usd, :unconverted_price
  
  def is_diamond?
    taxons.each do |taxon|
      return true if taxon.ancestors.collect(&:name).include?("Diamonds")
    end
    
    false
  end
end
