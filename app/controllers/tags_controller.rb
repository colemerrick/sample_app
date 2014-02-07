class TagsController < ApplicationController

  def show
    @feed_items = Micropost.tagged_with(params[:tag]).paginate(page: params[:page])
  end

  def index
  end
  
end