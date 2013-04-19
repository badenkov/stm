class Web::Stories::ApplicationController < Web::ApplicationController
  helper_method :current_story

  private

  def current_story
    @current_story ||= Story.find(params[:story_id])
  end
end
