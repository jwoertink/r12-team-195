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

  def image_for_drink(drink, size = nil)
    name = drink.glass.to_s.downcase.gsub(/[^a-z0-9]/, '-') + '.png'
    path = Rails.root.join('app', 'assets', 'images', 'drinks', name)

    if drink.photo? && !size.nil?
      drink.photo.send(size).url
    elsif File.exists?(path)
      "drinks/#{name}"
    else
      'drinks/old-fashioned-glass.png'
    end
  end

  def image_for_glass(drink)
    name = 'glass-' + drink.glass.to_s.downcase.gsub(/[^a-z0-9]/, '-') + '.png'
    path = Rails.root.join('app', 'assets', 'images', 'glasses', name)

    if File.exists?(path)
      "glasses/#{name}"
    else
      'glasses/glass-old-fashioned-glass.png'
    end
  end
end
