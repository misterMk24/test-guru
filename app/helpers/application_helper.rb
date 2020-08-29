module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Project Test-Guru', "https://github.com/#{author}/#{repo}"
  end

  def greetings_message_view
    if user_signed_in?
      "<p class='nav user'>Welcome, <b>#{current_user.username}</b> Guru</p>".html_safe
    end
  end

  def flash_message_view(name)
    unless flash.empty?
      content_tag :p, flash[name], class: "flash #{name}"
    end
  end
end
