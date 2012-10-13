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
    image_tag(asset_path("#{name}.png"))
  end

  def event_to_string(event)
    string = case event.event_type
    when 'new_drink'
      "New drink #{link_to(event.subject.name, event.subject)} mixed by #{link_to(event.actor.name, user_path(event.actor))} #{time_ago_in_words(event.created_at)} ago"
    when 'new_rating'
      "#{link_to(event.actor.name, user_path(event.actor))} just #{((event.subject.liked?) ? 'liked' : 'disliked')} #{link_to(event.secondary_subject.name, event.secondary_subject)}"
    when 'new_user'
      "New user #{link_to(event.subject.name, user_path(event.subject))}"
    end

    string.html_safe
  end
end
