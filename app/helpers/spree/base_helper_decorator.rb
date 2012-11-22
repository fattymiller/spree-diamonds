Spree::BaseHelper.class_eval do
  def define_image_method(style)
    self.class.send :define_method, "#{style}_image" do |product, *options|
      options = options.first || {}
      if product.images.empty?
        if product.has_variants?
          image = product.variants.first.images.first
          
          if image
            options.reverse_merge! :alt => image.alt.blank? ? product.name : image.alt
            image_tag image.attachment.url(style), options
          else
            image_tag "noimage/#{style}.png", options
          end
        else
          image_tag "noimage/#{style}.png", options
        end
      else
        image = product.images.first
        options.reverse_merge! :alt => image.alt.blank? ? product.name : image.alt
        image_tag image.attachment.url(style), options
      end
    end
  end
end
