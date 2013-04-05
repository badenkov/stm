class Web::Stories::ApplicationController < Web::ApplicationController

  private

  def resource_story
    StoryType.find(params[:story_id])
  end
  helper_method :resource_story
end
