module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(name, repo)
    link_to name, "https://github.com/#{name}/#{repo}", target: :_blank
  end

  def flash_messages
    flash.map do |key, value|
      content_tag :p, value, class: "flush-#{@key}"
    end.join.html_safe
  end

  def human_names(klass, fields_array)
    names = fields_array.map {|f| klass.human_attribute_name(f)}
    if block_given?
      names.each {|name| yield(name)}
    else
      names
    end
  end
end
