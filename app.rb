require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/activerecord'

set :datebase, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base

end


# def init_db
# 	@db = SQLite3::Database.new 'leprosorium.db'
# 	@db.results_as_hash = true 
# end


# before do
# 	# индициализация БД
# 	init_db
# end

# configure do
# 	# инициализация БД
# 	init_db

# 	# создает таблицу если таблица не существует
# 	@db.execute 'create table if not exists Posts
# 	(
# 		id INTEGER PRIMARY KEY AUTOINCREMENT,
# 		created_date DATE,
# 		content TEXT
# 	)'

# 	# создает таблицу если таблица не существует
# 	@db.execute 'create table if not exists Comments
# 	(
# 		id INTEGER PRIMARY KEY AUTOINCREMENT,
# 		created_date DATE,
# 		content TEXT,
# 		post_id integer
# 	)'
# end


get '/' do
	erb "Hello!"
end





