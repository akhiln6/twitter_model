module TweetsHelper
  def like_dislike_button_text(tweet)
    if tweet.voted_up_by?(current_user)
      "Dislike"
    else
      "Like"
    end
  end
end
