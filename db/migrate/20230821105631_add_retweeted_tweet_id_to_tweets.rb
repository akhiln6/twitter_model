class AddRetweetedTweetIdToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :retweeted_tweet_id, :integer
    add_index :tweets, :retweeted_tweet_id
  end
end
