module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title)
    base_title = "ONESELF"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end