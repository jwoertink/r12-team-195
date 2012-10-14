module ApplicationHelper
  def bootstrap_flash
   flash_messages = []
   flash.each do |type, message|
     type = :success if type == :notice
     type = :error   if type == :alert
     text = content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert") + message, :class => "alert fade in alert-#{type}")
     flash_messages << text if message
   end
   flash_messages.join("\n").html_safe
  end

  def glass_image_for_drink(drink)
    name = drink.glass.downcase.gsub(/[^a-z0-9]/, '-')
    image_tag(asset_path("glasses/#{name}.png"), style: 'height:140px;')
  end
end
