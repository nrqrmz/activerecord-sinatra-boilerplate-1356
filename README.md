# Active Record Sinatra for Batch #1356

## What is Sinatra
- Web framework
- Sinatra can send an HTTP request and retrieve an HTML response (GET/POST/PATCH/DELETE)

## Setup
Create a directory for your Sinatra project and run:
```
git clonegit@github.com:lewagon/activerecord-sinatra-boilerplate.git
```
```
rm -rf .git
```
```
bundle install
```
## User Journey
> As a user I can list all the restaurants

> As a user I can see one restaurant's details

## Create the database
```
rake db:create
```
```
rake db:timestamp
```
```
touch 20230928192617_create_restaurants.rb
```
```ruby
class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city

      t.timestamps
    end
  end
end
```
```
rake db:migrate
```
## Seed the databe
Seed the database with 10 restaurants
```ruby
require 'faker'

10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    city: Faker::Address.city
  )
end
```
```
rake db:seed
```
## Start Sinatra
```
ruby app.rb
```
## Display all restaurants

```ruby
# app.rb
get "/" do
  @restaurants = Restaurant.all
  erb :index
end
```
```erb
# views/index.erb
<h1>My restaurants app</h1>
<h2>This is the list of my favorite restaurants</h2>

<ol>
  <% @restaurants.each do |restaurant| %>
    <li>
      <a href="/restaurants/<%= restaurant.id %>">
        <%= restaurant.name %>
      </a>
    </li>
  <% end %>
</ol>
```
## Display one restaurant
```ruby
# app.rb
get "/restaurants/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id)

  erb :show
end
```
```erb
# views/show.erb
<h1><%= @restaurant.name %></h1>
<h2><%= @restaurant.city %></h2>
<hr>
<a href="/">Back to restaurants</a>
```
