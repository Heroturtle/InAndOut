module ApplicationHelper

  def list_item(active_on: nil, &block)
    css_klass = active_path?(active_on) ? 'active' : ''
    content_tag :li, capture(&block), class: css_klass
  end

  def active_path?(path)
    path == request.fullpath
  end

end
