module ApplicationHelper
  def set_javascript(*sources)
    content_for(:javascript, sources.join(', ') + ', ')
  end

  def javascript
    if content_for?(:javascript)
      sources = content_for(:javascript).split(',').map(&:strip).select(&:present?)
      javascript_include_tag *sources
    end
  end
end