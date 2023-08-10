class CommentsController < ApplicationController
	def index 
	
	end
	def new
		
	end
	def create 
		@tweet = Tweet.find(params[:tweet_id])

    @comment = @tweet.comments.create(comment_params)
    redirect_to root_path

		
	end

	private
	def comment_params
		params.require(:comment).permit(:body).merge(user_id: current_user.id)
	end




end
