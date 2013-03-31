class Web::StoriesController < Web::ApplicationController
  def index
    @q = Story.search(params[:q])
    @stories = @q.result(distinct: true)
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])
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
