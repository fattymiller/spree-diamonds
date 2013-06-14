Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
                     :name => "add_certification_upload_to_variant",
                     :insert_before => "[data-hook=\"sku\"]",
                     :disabled => true,
                     :text => "
                       <%= f.label :diamond_certificate, 'Certificate file:' %><br />
                       <%= f.file_field :diamond_certificate %>")

Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
                     :name => "add_certification_download_link_to_variant",
                     :insert_before => "[data-hook=\"sku\"]",
                     :disabled => true,
                     :text => "<p><%= link_to \"View current certificate\", f.object.diamond_certification.images.first.attachment.url(:original), :target => \"_blank\" if f.object.diamond_certification && f.object.diamond_certification.images.first %></p>")

