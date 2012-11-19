Spree::AppConfiguration.class_eval do
  preference :conversion_rate, :string, :default => "1" # :string because they have no :decimal\:float :(
  
  def conversion_rate
    (self[:conversion_rate] || 1).to_f
  end
end
