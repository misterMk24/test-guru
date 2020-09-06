module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "#{t('.project')} Test-Guru", "https://github.com/#{author}/#{repo}"
  end

  def greetings_message_view
    layout_path = 'layouts.application'
    if user_signed_in?
      "<h3><div class='text-right'>#{t("#{layout_path}.welcome")}, 
            <b>#{current_user.username}</b> #{t("#{layout_path}.guru")}</div></h3>".html_safe
    end
  end

  def flash_message_view(name)
    unless flash.empty?
      content_tag :p, flash[name], class: "flash #{name}"
    end
  end
end
