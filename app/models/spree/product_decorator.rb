Spree::Product.class_eval do
  attr_accessible :is_in_usd
  delegate_belongs_to :master, :is_in_usd
end
