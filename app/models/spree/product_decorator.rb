Spree::Product.class_eval do
  attr_accessible :is_in_usd, :unconverted_price
  delegate_belongs_to :master, :is_in_usd, :unconverted_price
  
  def is_diamond?
    taxons.any? { |taxon| taxon.name.include?("Diamonds") || taxon.ancestors.collect(&:name).include?("Diamonds") }
  end
  
  def stock_count
    has_variants? ? variants.collect(&:on_hand).inject(&:+) : master.on_hand
  end
end
