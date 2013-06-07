Deface::Override.new(:virtual_path => "spree/admin/general_settings/edit",
                     :name => "add_currency_conversion_rate_to_general_settings",
                     :insert_after => "fieldset p:first",
                     :disabled => false,
                     :text => "
     <a id=\"conversaion_rate\"></a>
     <%= label_tag(:conversion_rate, 'Conversion rate (USD -> AUD): ') + tag(:br) %>
     <%= preference_field_tag(:conversion_rate, Spree::Config.conversion_rate, :type => :string) %>
 ")
