Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_in_usd_to_variant",
                     :insert_after => "#product_price_field",
                     :disabled => false,
                     :text => "
       <%= f.field_container :is_in_usd do %>
         <%= f.label :is_in_usd, 'Price is in USD?' %><br />
         <%= f.check_box :is_in_usd %>
         <%= f.error_message_on :is_in_usd %>
       <% end %>
 ")