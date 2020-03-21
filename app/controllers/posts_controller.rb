class PostsController < ApplicationController
   before_action :authenticate_account!, except: [:index, :show ]
   before_action :set_post, only: [:show]
   before_action :auth_subscriber, only: [:new]


	 def index
		 @posts = Post.all
	 end

	 def show
     @comment = Comment.new
	 end

	 def new
		 @community = Community.find(params[:community_id])
		 @posts = Post.new
	 end

	 def create
		 @posts = Post.new post_values
		 @posts.account_id = current_account.id
		 @posts.community_id = params[:community_id]

		 if @posts.save
       redirect_to community_path(@posts.community_id)
		 else
			 @community = Community.find(params[:community_id])
			 render :new
		 end
	 end

	 private

	 def set_post
		 @posts = Post.includes(:comments).find(params[:id])
	 end

   def auth_subscriber
     unless account_signed_in?
       redirect_to root_path, flash: { danger: "You are not authorized to view this page" }
     end
   end

	 def post_values
		 params.require(:post).permit(:title, :body, :rules)
	 end
end
