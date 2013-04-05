class Web::Stories::CommentsController < Web::Stories::ApplicationController
  before_filter :authenticate!

  def edit
    @comment = ::Stories::CommentType.find(params[:id])
  end

  def create
    @comment = ::Stories::CommentType.new(params[:comment])
    @comment.commentable = resource_story
    @comment.user = current_user
    if (@comment.save)
      redirect_to params[:from] || story_path(resource_story)
    else
      render "new"
    end
  end
  
  def update
    @comment = ::Stories::CommentType.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to params[:from] || story_path(resource_story)
    else
      render :edit
    end
  end

  def destroy
    @comment = ::Stories::CommentType.find(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
