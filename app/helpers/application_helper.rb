module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title.to_s }
  end

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'Jeff and Krista\'s Wedding'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def yield_or_default(section, default = '')
    content_for?(section) ? content_for(section) : default
  end
end
