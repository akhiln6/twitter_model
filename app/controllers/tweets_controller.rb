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
    @tweet = current_user.tweets.find(params[:id])

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



  def vote
    @tweet = Tweet.find(params[:id])
    if @tweet.voted_up_by?(current_user)
      @tweet.downvote_by(current_user)
    else
      @tweet.upvote_by(current_user)
    end
    redirect_to root_path
  end
  

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end




end
