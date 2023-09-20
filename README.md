# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Table follows containing the followings fields:
- follow_id :
- following_user_id:
- follower_user_id:

Table users containing the followings fields:
- user_id integer:
- name:
- username:
- bio:
- location:
- link:

Table tweets containing the followings fields:
tweet_id:
- user_id:
- retweet_id:
- quoted:
- content:
- hashtags:
- created_at:

Table replies containing the followings fields:
- reply_id:
- tweet_id:
- user_id:
- quote:

Table hashtags containing the followings fields:
- hashtag_id:
- name:
- tweets:


Table taggins containing the followings fields:
- tweet_id:
- hashtags_id:


Table likes containing the followings fields:
- likes_id:
- tweet_id:
- user_id:
- likes_count:

Table bookmarks containing the followings fields:
- bookmark_id:
- tweet_id integer:
- user_id:


//Ref: xweets.user_id > users.user_id // many-to-one
//Relationship with Tweets and Users table
Ref: tweets.user_id > users.user_id
//Relationship with taggings an tweets
Ref: taggins.tweet_id > tweets.tweet_id
//Relationship with taggings and hashtags
Ref: taggins.tweet_id > hashtags.hashtag_id
//Relationship with users and bookmarks
Ref: users.user_id > bookmarks.user_id
// Realtionship with tweets and replies
Ref: tweets.tweet_id > replies.tweet_id
//Self references between tweet_id an retweet_id
Ref: tweets.tweet_id < tweets.retweet_id
//Relationship with tweets and likes
Ref: tweets.tweet_id < likes.tweet_id
// Relationship with likes and users
Ref: likes.user_id > users.user_id
// Relationship with follows and users
Ref: follows.follower_user_id > users.user_id
Ref: follows.following_user_id > users.user_id
//Relationship with replies and users
Ref: replies.user_id > users.user_id

![alt text](./app/assets/images/Untitled.png)