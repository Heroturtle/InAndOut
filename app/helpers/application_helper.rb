module ApplicationHelper

  def full_title(page_title)
    base_title = "InAndOut"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def list_item(active_on: nil, &block)
    css_klass = active_path?(active_on) ? 'active' : ''
    content_tag :li, capture(&block), class: css_klass
  end

  def active_path?(path)
    path == request.fullpath
  end

end
