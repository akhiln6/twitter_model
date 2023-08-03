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

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    redirect_to root_path
  end
  

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end




end
