class Api::V1::StoriesController < Api::V1::ApplicationController

  # List of all stories
  # ===================
  #
  # GET /api/v1/stories.json
  #
  # Input
  # -----
  #   * page Пэджинация
  #   * Фильтрация в соответствии с gem-ом ransack
  #
  # Response
  # --------
  #
  #  Status: 200 Ok
  #
  # Example
  # -------
  #
  # curl -u "username" --request GET http://localhost:3000/api/v1/stories.json
  #
  def index
    @q = Story.ransack(params[:q])
    @stories = @q.result(distinct: true).page(params[:page])
    respond_with(@stories)
  end


  # Show story
  #
  # GET /api/v1/stories
  def show
    @story = Story.find(params[:id])

    respond_with(@story)
  end

  # Create new story
  # ================
  #
  # POST /api/v1/stories.json
  #
  # Input
  # -----
  #
  #   * title
  #     _Required_ Title of stories
  #
  #   * description 
  #     Description of story
  #
  # Response
  # --------
  #
  # * Status: 201 Created
  # ```
  # {
  #   "id": 1,
  #   "title": "Test story"
  #   "description": "Description of story",
  #   "updated_at": "2012-04-17T15:00:49Z"
  # }
  # ```
  #
  # Example:
  # --------
  #
  # curl -u "username" --request POST -d "story[title]=Test%20story" http://localhost:3000/api/v1/stories.json
  #
  # response:
  #   
  def create
    @story = current_user.requested_stories.build(params[:story])
    @story.save

    respond_with @story, status: :created
  end

  # Update story
  # ============
  #
  # PUT /api/v1/stories/<story_id>.json
  #
  # Input
  # -----
  #
  #   * title
  #     _Required_ Title of stories
  #
  #   * description 
  #     Description of story
  #
  # Response
  # --------
  #
  # * Status: 200 OK
  # ```
  # {
  #   "id": 1,
  #   "title": "Test story"
  #   "description": "Description of story",
  #   "updated_at": "2012-04-17T15:00:49Z"
  # }
  # ```
  #
  # Example:
  # --------
  #
  #   curl -v -u "username" --request PUT -d "story[title]=Test1" http://localhost:3000/api/v1/stories/23.json
  #
  def update
    @story = Story.find(params[:id])
    @story.update_attributes(params[:story])

    respond_with @story
  end

  # Destroy story
  # =============
  #
  # DELETE /api/v1/stories/<story_id>.json
  #
  # Input
  # -----
  #
  #   * title
  #     _Required_ Title of stories
  #
  #   * description 
  #     Description of story
  #
  # Response
  # --------
  #
  # * Status: 204 No Content
  # ```
  # {
  #   "id": 1,
  #   "title": "Test story"
  #   "description": "Description of story",
  #   "updated_at": "2012-04-17T15:00:49Z"
  # }
  # ```
  #
  # Example:
  # --------
  #
  #   curl -u "username" --request DELETE http://localhost:3000/api/v1/stories/23.json
  #
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    head :no_content
  end
end
