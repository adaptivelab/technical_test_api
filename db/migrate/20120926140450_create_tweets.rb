class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :message
      t.string :user_handle
      t.integer :followers
      t.float :sentiment

      t.timestamps
    end
  end
end
