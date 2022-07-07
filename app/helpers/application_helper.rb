module ApplicationHelper

  def user_avatar(user, size=250)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fill: [150, nil])
    else
      gravatar_image_url("default")
    end
  end

  def flash_class_name(name)
  case name
  when "notice" then "success"
  when "alert"  then "danger"
  else name
  end
end

end
