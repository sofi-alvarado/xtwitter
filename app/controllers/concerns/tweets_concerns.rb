module TweetsConcerns extend ActiveSupport::Concern 

    def create_like(user, tweet)
        like = Like.new(tweet_id: tweet, user_id: user)
        like.save!
        like
    end

end
 