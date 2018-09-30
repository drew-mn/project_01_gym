require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/member')
also_reload( '../models/*' )


get '/members' do
  @members = Member.all()
  erb(:"members/index")
end

get '/members/new' do
  @member = Member.all()
  erb(:"members/new")
end

post '/members' do
  @member = Member.new(params)
  @member.save()
  erb(:"members/index")
end

get '/members/:id' do
  @member = Member.find(params[:id])
  erb(:"members/find")
end

get '/members/:id/edit' do
  @member = Member.find(params['id'])
  erb(:"members/edit")
end

post '/members/:id' do
  Member.new(params).update()
  redirect to '/members'
end

post '/members/:id/delete' do
  Member.delete(params[:id])
  redirect to '/members'
end
