class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :microposts, through: :taggings

	has_many :tag_relationships, foreign_key: "followed_tag_id", dependent: :destroy
	has_many :followed_tags, through: :tag_relationships, source: :followed_tag
    has_many :reverse_relationships, foreign_key: "followed_tag_id", class_name: "TagRelationship", dependent: :destroy
    has_many :tag_followers, through: :reverse_relationships, source: :tag_follower

    def self.tagged_with(name)
      Tag.find_by_name!(name).microposts
    end

	def self.tag_counts
	  Tag.select("tags.*, count(taggings.tag_id) as count").
	    joins(:taggings).group("taggings.tag_id")
	end

	def tag_list
	  tags.map(&:name).join(", ")
	end

	def tag_list=(names)
	  self.tags = names.split(",").map do |n|
	    Tag.where(name: n.strip).first_or_create!
	  end
	end

	private

    def tag_params
      params.require(:tag).permit(:name, :id)
    end
end
