class Api::StoriesController < Api::ApplicationController

  def index
    @q = Story.ransack(params[:q])
    @stories = @q.result(distinct: true)
    respond_with(@stories)
  end

  def show
    @story = Story.find(params[:id])
    respond_with(@story)
  end
end
