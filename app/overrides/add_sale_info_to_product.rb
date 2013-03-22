Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "add_sale_info_to_product",
                     :insert_before => "code[erb-loud]:contains('field_container :available_on')",
                     :text => "
                     <p class=\"\" id=\"product_sale_price_field\">
                       <label for=\"product_sale_price\">Sale Price</label><br>
                       <input id=\"product_sale_price\" name=\"product[sale_price]\" size=\"30\" type=\"text\">
                     </p>
                     
                     <p class=\"\" id=\"product_sale_available_from_field\">
                       <label for=\"product_sale_available_from\">Sale starts</label><br>
                       <input class=\"datepicker\" id=\"product_sale_available_from\" name=\"product[sale_starts]\" size=\"30\" type=\"text\">
                     </p>
                     
                     <p class=\"\" id=\"product_sale_ends_field\">
                       <label for=\"product_sale_ends\">Sale ends</label><br>
                       <input class=\"datepicker\" id=\"product_sale_ends\" name=\"product[sale_ends]\" size=\"30\" type=\"text\">
                     </p>")
 
