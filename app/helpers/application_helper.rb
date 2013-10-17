module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Leaguer').join(' - ')
      end
    end
  end
end
