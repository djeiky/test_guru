module ApplicationHelper

  def current_year
    Date.today.year
  end

  def github_url(name, repo)
    link_to name, "https://github.com/#{name}/#{repo}"
  end
end
