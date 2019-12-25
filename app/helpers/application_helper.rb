module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info alert-dismissible fade show"
    when 'success' then "alert alert-success alert-dismissible fade show"
    when 'error' then "alert alert-danger alert-dismissible fade show"
    when 'alert' then "alert alert-warning alert-dismissible fade show"
    end
  end

  def user_avatar(user)
    asset_path('user.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fas fa-#{icon_class}"
  end
end
