class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  # has_many :retweets, class_name: "Tweet", foreign_key: "retweeted_tweet_id"
  # belongs_to :original_tweet, class_name: "Tweet", optional: true, foreign_key: "retweeted_tweet_id"
  belongs_to :tweet, foreign_key: "retweeted_tweet_id", optional: true

  acts_as_votable

  has_one_attached :tweet_file
end
