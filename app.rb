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
	c = Client.new(params[:client])
	c.save

	erb "<h2>Thank you </h2>"
end


