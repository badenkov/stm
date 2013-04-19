class Web::StoriesController < Web::ApplicationController
  before_filter :authenticate!

  def index
    @q = Story.ransack(params[:q])
    @stories = @q.result(distinct: true).page(params[:page])
  end

  def show
    @story = Story.includes(comments: :user).find(params[:id])
    @comment = Comment.new
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = current_user.requested_stories.build(params[:story])
    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_url
  end
end
