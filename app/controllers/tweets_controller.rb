class TweetsController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
    
    #order(created_at: :asc)
  end  
  def show
    @tweet = Tweet.find(params[:id])

  end

  def new
    @tweet = Tweet.new
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
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy

    redirect_to root_path
  end

  def upvote
    @tweet = Tweet.find(params[:id])
    @tweet.upvote_by current_user
    redirect_to root_path
  end

  def downvote
    @tweet = Tweet.find(params[:id])
    @tweet.downvote_by current_user
    redirect_to root_path
  end
  

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end




end
