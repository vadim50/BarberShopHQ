require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base

	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true

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
	if c.save
		erb "<h2>Thank you </h2>"
	else
		@error = c.errors.full_messages.first
		erb "<h2>Error</h2>"
	end
end


