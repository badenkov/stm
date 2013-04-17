class Api::StoriesController < Api::ApplicationController

  # List of all stories
  # ===================
  #
  # GET /api/stories.json
  #
  # Input
  # -----
  #
  # Response
  # --------
  #
  # Example
  # -------
  #
  def index
    @q = Story.ransack(params[:q])
    @stories = @q.result(distinct: true).page(params[:page])
    respond_with(@stories)
  end


  # Show story
  #
  # GET /api/stories
  def show
    @story = Story.find(params[:id])
    respond_with(@story)
  end

  # Create new story
  # ================
  #
  # POST /api/stories.json
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
  #   curl -u "user" POST http://localhost:3000/api/stories
  def create
    @story = current_user.requested_stories.build(params[:story])

    if @story.save
      render 'create', status: :created
    else
      render 'errors', status: :not_acceptable
    end
  end

  # Update story
  # ============
  #
  # PUT /api/stories/<story_id>.json
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
  #   curl -u "user" POST http://localhost:3000/api/stories
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      head :success
    else
      head :not_acceptable
    end
  end

  # Destroy story
  # =============
  #
  # DELETE /api/stories/<story_id>.json
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
  #   curl -u "user" POST http://localhost:3000/api/stories
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    head :no_content
  end
end
