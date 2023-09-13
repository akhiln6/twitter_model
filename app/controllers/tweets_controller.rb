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
        
        @tweet.tweet_file.attach(params[:tweet][:tweet_file])
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

  def retweet
    @tweet = Tweet.find(params[:id])
    @retweet = current_user.tweets.create(body:@tweet.body,retweeted_tweet_id: @tweet.id)
    redirect_to root_path
  end

  def download
    @tweet = Tweet.find(params[:id])
    if @tweet.tweet_file.attached?
      file = @tweet.tweet_file.download
      # Sanitize the filename to remove invalid characters
      sanitized_filename = @tweet.tweet_file.blob.filename.to_s.gsub(/[^0-9A-Za-z.\-]/, '_')
      
      send_file file, filename: sanitized_filename, disposition: 'attachment'
    else
      redirect_to root_path, alert: 'File not found.'
    end
  end


  private

  def tweet_params
    params.require(:tweet).permit(:body, :tweet_file)
  end



end
