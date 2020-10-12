class CommentsController < ApplicationController
  def create
    # プロトタイプモデル(テーブル)から引っ張る
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    @comment.prototype_id = @prototype.id
    if @comment.save
      redirect_to prototype_path(@prototype.id)
    else
      # @prototype = @comment.prototype
      # @comments = @prototype.comments
      # render "prototypes/show"
      render 'prototypes/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
