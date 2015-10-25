module ApplicationHelper
  # return the title of the page
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Leaguer').join(' - ')
      end
    end
  end
end
