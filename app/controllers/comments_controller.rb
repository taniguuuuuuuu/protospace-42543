class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = Prototype.find(comment_params[:prototype_id])
      @comments  = @prototype.comments.includes(:user).order(created_at: :asc)
      flash.now[:alert] = @comment.errors.full_messages.join(", ")
      render "prototypes/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :prototype_id)
  end
end
