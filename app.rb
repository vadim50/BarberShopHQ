require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end

before do
	@barbers = Barber.order "created_at DESC"
end


get '/' do
	
	erb :index
end


get '/visit' do
	
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.color = @color
	c.save

	erb "<h2>Thank you #{@username}</h2>"
end


