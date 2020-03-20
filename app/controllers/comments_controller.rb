class CommentsController < ApplicationController
  def create
   @comment = Comment.new comment_params
   @comment.account_id = current_account.id


			if @comment.save
				@comment = Comment.where(post_id: @comment.post_id)
				redirect_back fallback_location: root_path
			else
				#unable to save
			end
	end

	def comment_params
		params.require(:comment).permit(:message, :post_id)
	end
end
