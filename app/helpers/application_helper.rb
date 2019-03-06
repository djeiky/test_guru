module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(name, repo)
    link_to name, "https://github.com/#{name}/#{repo}", target: :_blank
  end
end
