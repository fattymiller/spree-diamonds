class Spree::ConversionRateConfiguration < Spree::Preferences::Configuration
  preference :conversion_rate, :string, :default => "1" # :string because they have no :decimal\:float :(
end