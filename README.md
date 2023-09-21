# Practice Lab 1: Twitter Data Modeling

The following repository includes: 
* Active Record Models
* Migrations
* Associations

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes

### Prerequisites

Before you start you'll need:

* Ruby version 3.1.2
* Rails version 7.0.4
* PostgreSQL 14.9
* Ubuntu OS

### Clone the repository

* Open Terminal.

* Change the current working directory to the location where you want the cloned directory.

* Type git clone, and then paste the URL of this repository.

```
$ git clone https://github.com/sofi-alvarado/xtwitter.git
```
* Press Enter and you're ready to go!

## Setting up the enviroment

Move to the directory of your project.

```
$ cd xtwitter
```
Connect to PostgreSQL and enter your machine user and password

```
$ sudo su postgres
```
Enter to PostgreSQL command line
```
$ psql
```
Run the following command to modify your PostgreSQL user and password
```
$ ALTER USER postgres PASSWORD 'your-password';
```
When finish create the database
```
$ run rails db:create
```
And finally run 
```
$ run rails db:migrate
```

## Entity Relationship Diagram explained

![alt text](./app/assets/images/Untitled.png)

Table **follows** containing the followings fields:
- **follow_id:** a follow id as primary key.
- **following_user_id:** a following id as a foreign key.
- **follower_user_id:** a follower as a foreign key.


Table **users** containing the followings fields:
- **user_id:** a user id as primary key.
- **name:** to store the name of the user.
- **username:** unique identifier for a user.
- **bio:** biography of the user.
- **location:** location of the user
- **link:** link to any website or social media.

Table **tweets** containing the followings fields:
- **tweet_id:** a tweet id id as primary key.
- **user_id:** an user id as a foreign key.
- **retweet_id:** a retweet id as a foreign key.
- **quoted:** boolean type to check if it is a tweet or a repost.
- **content:** to store the content of a tweet.
- **hashtags:** to store the hashtags a tweet may have.
- **created_at:** to show when the tweet was created.

Table **replies** containing the followings fields:
- **reply_id:** a reply id as primary key.
- **tweet_id:** a tweet id as a foreign key.
- **user_id:** an user id as a foreign key.
- **quote:** to store the content of the reply.

Table **hashtags** containing the followings fields:
- **hashtag_id:** a hashtag id as primary key.
- **name:** to store the name of the hashtag
- **tweets:** to store the tweets that belongs to a hashtag.

Table **taggins** containing the followings fields:
- **tweet_id:** a tweet id as a foreign key.
- **hashtags_id:** hashtag id as a foreign key.


Table **likes** containing the followings fields:
- **likes_id:** a like id as primary key.
- **tweet_id:** a tweet id as a foreign key.
- **user_id:** an user id id as a foreign key.
- **likes_count:** to count the likes in tweets.

Table **bookmarks** containing the followings fields:
- **bookmark_id:** a bookmark id as primary key.
- **tweet_id:** a tweet id as a foreign key.
- **user_id:** an user id as a foreign key.
