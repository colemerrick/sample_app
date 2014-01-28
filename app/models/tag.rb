class Tag < ActiveRecord::Base
	has_many :taggings
	has_many :microposts, through: :taggings

	private

    def tag_params
      params.require(:tag).permit(:name)
    end
end
