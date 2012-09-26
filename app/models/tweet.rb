class Tweet < ActiveRecord::Base
  attr_accessible :followers, :message, :sentiment, :user_handle
end
