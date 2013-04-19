module ApplicationHelper
  def markdown(content)
    return if content.nil?
    markdown = RDiscount.new(content)
    sanitized_content = sanitize content
    markdown.to_html.html_safe
  end
end
