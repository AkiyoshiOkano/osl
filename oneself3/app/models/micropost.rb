class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true
  validates :user_id, presence: true
  acts_as_ordered_taggable_on :tags
end