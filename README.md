
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

you can run the project with docker compose up 

you can access 6 routes 

Create new application with name params 
post /applicaition

APPLICATION
show the token of the application the id will be the token 
GET  /applications/:id

CHAT
Create new chat with new number
post /applications/:application_id/chats

show the chat with the number scoped with the token id of the application 

get /applications/:application_id/chats/:id #

MESSAGE
show the message of id is number chat id is the number of the chat and application id will be the token
GET  /applications/:application_id/chats/:chat_id/messages/:id

you can send in th url the token for the application_id and chat number for the chat_id and then in body we will have a params name body 
POST  /applications/:application_id/chats/:chat_id/messages


you can also run the specs

docker compose sudo docker-compose run app rspec 