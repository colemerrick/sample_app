class TagRelationship < ActiveRecord::Base
	belongs_to :tag_follower, class_name: "User"
	belongs_to :followed_tag, class_name: "Tag"
	validates :tag_follower_id, presence: true
	validates :followed_tag_id, presence: true
end
