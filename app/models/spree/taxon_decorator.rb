Spree::Taxon.class_eval do
  def is_diamond?
    result = ancestors.any? { |taxon| taxon.name.include?("Diamonds") }
    
    puts ">>> #{name}: #{result}"
    result
  end
end
