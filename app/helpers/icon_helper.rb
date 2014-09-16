module IconHelper

  ICON_MAPPINGS = {
    # Generic actions
    :save => 'fa-check',
    :cancel => 'fa-times',
    :back => 'fa-arrow-left',

    # Record actions
    :new => 'fa-plus',
    :edit => 'fa-pencil',
    :destroy => 'fa-remove',
    :trash => 'fa-trash-o',
    :restore => 'fa-repeat',
    :copy => 'fa-copy',

    # Model icons
    :dashboard => 'fa-dashboard',
    # ... more
  }

  def icon(kind, label = nil, &block)
    label ||= capture(&block) if block_given?
    icon = content_tag :i, nil, class: icon_class(kind)
    if label
      icon + label
    else
      icon
    end
  end

  def icon_class(kind)
    icon_class = ICON_MAPPINGS.fetch(kind.to_sym) do
      raise "Undefined icon: #{ kind }"
    end

    "icon fa #{icon_class}"
  end

end