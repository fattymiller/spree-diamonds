Spree::Image.class_eval do
  before_post_process :is_image?

  def is_image?
    ["image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/gif"].include?(self.attachment_content_type) 
  end
end