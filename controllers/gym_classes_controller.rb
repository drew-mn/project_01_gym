require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/gym_class')
require_relative('../models/member')
also_reload( '../models/*' )


get '/gym_classes' do
  @gym_classes = Gym_Class.all()
  @gym_class = Gym_Class.all()
  erb(:"gym_classes/index")
end

get '/gym_classes/new' do
  @gym_class = Gym_Class.all()
  erb (:"gym_classes/new")
end

post '/gym_classes' do
  @gym_classes = Gym_Class.new(params)
  @gym_classes.save()
  erb (:"gym_classes/index")
end

get '/gym_classes/:id' do
  @gym_classes = Gym_Class.find(params['id'])
  erb(:"gym_classes/find")
end

get '/gym_classes/:id/edit' do
  @gym_class = Gym_Class.all()
  @gym_classes = Gym_Class.find(params[:id])
  erb(:"gym_classes/edit")
end

post '/gym_classes/:id' do
  Gym_Class.new(params).update()
  redirect to '/gym_classes'
end

post '/gym_classes/:id/delete' do
  Gym_Class.delete(params[:id])
  redirect to '/gym_classes'
end
