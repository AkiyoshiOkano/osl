module UsersHelper
include ActsAsTaggableOn::TagsHelper

  def current_user?(user)
    user == current_user
  end
end
