class TagRelationshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @tag = Tag.find_by(params[:tag_relationship][:followed_tag_id])
    current_user.follow_tag!(@tag)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @tag = TagRelationship.find(params[:id]).followed_tag
    current_user.unfollow_tag!(@tag)
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end