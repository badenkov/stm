class Web::StoriesController < Web::ApplicationController
  before_filter :authenticate!

  def index
    @q = Story.search(params[:q])
    @stories = @q.result(distinct: true).page(params[:page])
  end

  def show
    @story = StoryType.includes(comments: :user).find(params[:id])
    @comment = ::Stories::CommentType
  end

  def new
    @story = StoryType.new
  end

  def edit
    @story = StoryType.find(params[:id])
  end

  def create
    @story = StoryType.new(params[:story])
    @story.requester = current_user
    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  def update
    @story = StoryType.find(params[:id])
    if @story.update_attributes(params[:story])
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story = StoryType.find(params[:id])
    @story.destroy
    redirect_to stories_url
  end
end
