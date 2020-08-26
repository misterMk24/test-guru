module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Project Test-Guru', "https://github.com/#{author}/#{repo}"
  end

  def greetings_message_view
    if logged_in?
      "<p class='nav user'>Welcome, <b>#{current_user.username}</b> Guru</p>".html_safe
    end
  end
end
