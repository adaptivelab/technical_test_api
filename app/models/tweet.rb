class Tweet < ActiveRecord::Base
  attr_accessible :followers, :message, :sentiment, :user_handle

  # Returns 10 random tweets.
  scope :random_sample, :order => "RANDOM()", :limit => 2
end
