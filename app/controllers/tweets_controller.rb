class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
    #order(created_at: :asc)
  end

  def create 
    @tweet = current_user.tweets.new(tweet_params)
    
      if @tweet.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    
  end
  

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end




end
