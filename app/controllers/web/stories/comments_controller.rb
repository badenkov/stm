class Web::Stories::CommentsController < Web::Stories::ApplicationController
  before_filter :authenticate!

  def edit
    current_comment
  end

  def create
    @comment = current_story.comments.build(params[:comment])
    @comment.user = current_user
    if (@comment.save)
      redirect_to params[:from] || story_path(current_story)
    else
      render "new"
    end
  end
  
  def update
    if current_comment.update_attributes(params[:comment])
      redirect_to params[:from] || story_path(current_story)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def current_comment
    @comment ||= current_story.comments.find(params[:id])
  end
end
