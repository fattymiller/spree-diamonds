Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "change_master_price_target",
                     :replace => "code[erb-loud]:contains('f.text_field :price')",
                     :disabled => false,
                     :text => "<%= f.text_field :unconverted_price, :value => number_to_currency(@product.unconverted_price, :unit => '') %>")
 
Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_in_usd_to_variant",
                     :insert_after => "code[erb-loud]:contains('f.error_message_on :price')",
                     :disabled => false,
                     :text => "
     <%= f.field_container :is_in_usd do %>
       <%= f.check_box :is_in_usd, :style => 'margin-left: 20px;', :'data-rate' => Spree::Config.conversion_rate %>
       <%= f.label :is_in_usd, 'Price is in USD?' %>
       
       <p id=\"aud_display\" style=\"margin-left: 20px;\">
        <strong>AUD </strong> <span><%= number_to_currency @product.master.price %></span> (1 <strong>US dollar</strong> = <%= Spree::Config.conversion_rate %> <strong><%= Spree::Config.conversion_rate == 1 ? \"Australian dollar\" : \"Australian dollars\" %></strong>)
       </p>
     <% end %>
     
     <script type='text/javascript'>
       update_conversion_information = function() {
         var unconverted = parseFloat($(\"#product_unconverted_price\").val().replace(/,/, ''), 10);
         var rate = parseFloat($(\"#product_is_in_usd\").attr(\"data-rate\"), 10);
         
         $(\"#aud_display span\").html((unconverted * rate).toFixed(2));
       };
     
      update_checkbox_visibility = function(source) {
        if (source.is(':checked')) {
          $(\"#aud_display\").show();
        } else {
          $(\"#aud_display\").hide();
        }

        update_conversion_information();
      };
      
      $(\"#product_is_in_usd\").change(function() {
        update_checkbox_visibility($(this));
      });
      
      $(\"#product_unconverted_price\").change(function() {
        update_conversion_information();
      });
      
      $(document).ready(function() {
        update_checkbox_visibility($(\"#product_is_in_usd\").first());
      });
     </script>
")
 
Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
                     :name => "change_variant_price_target",
                     :replace => "code[erb-loud]:contains('f.text_field :price')",
                     :disabled => false,
                     :text => "<%= f.text_field :unconverted_price, :value => number_to_currency(@variant.unconverted_price, :unit => '') %>")
 
Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
                     :name => "add_in_usd_to_variant_maintenance",
                     :insert_after => "code[erb-loud]:contains('f.text_field :unconverted_price')",
                     :disabled => false,
                     :text => "     
     <%= f.field_container :is_in_usd do %>
       <%= f.check_box :is_in_usd, :style => 'margin-left: 20px;', :'data-rate' => Spree::Config.conversion_rate %>
       <%= f.label :is_in_usd, 'Price is in USD?' %>

       <% if !f.object.is_explicitly_usd? && f.object.in_usd? %>
         <p style=\"color: red; margin-left: 20px;\">This variant is in USD since it's parent product is in USD.</p>
       <% end %>
       
       <p id=\"aud_display\" style=\"margin-left: 20px;\">
        <strong>AUD </strong> <span><%= number_to_currency @variant.price %></span> (1 <strong>US dollar</strong> = <%= Spree::Config.conversion_rate %> <strong><%= Spree::Config.conversion_rate == 1 ? \"Australian dollar\" : \"Australian dollars\" %></strong>)
       </p>
     <% end %>
     
     <script type='text/javascript'>
       update_conversion_information = function() {
         var unconverted = parseFloat($(\"#variant_unconverted_price\").val().replace(/,/, ''), 10);
         var rate = parseFloat($(\"#variant_is_in_usd\").attr(\"data-rate\"), 10);
         
         $(\"#aud_display span\").html((unconverted * rate).toFixed(2));
       };
     
      update_checkbox_visibility = function(source) {
        if (source.is(':checked')) {
          $(\"#aud_display\").show();
        } else {
          $(\"#aud_display\").hide();
        }
        
        update_conversion_information();
      };
      
      $(\"#variant_is_in_usd\").change(function() {
        update_checkbox_visibility($(this));
      });
      
      $(\"#variant_unconverted_price\").change(function() {
        update_conversion_information();
      });
      
      $(document).ready(function() {
        update_checkbox_visibility($(\"#variant_is_in_usd\").first());
      });
     </script>
")