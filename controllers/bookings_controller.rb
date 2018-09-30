require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/member')
require_relative('../models/gym_class')
require_relative('../models/booking')
also_reload( '../models/*' )


get '/bookings' do
  @bookings = Booking.all
  @members = Member.all
  @gym_classes = Gym_Classes.all
  erb (:"bookings/index")
end

get '/bookings/new' do
  @bookings = Booking.all
  @members = Member.all
  @gym_classes = Gym_Classes.all
  erb(:"bookings/new")
end

post '/bookings' do
  @booking = Booking.new(params)
  @booking.save
  redirect to("/bookings")
end

get '/bookings/:id' do
  @booking = Booking.find(params[:id])
  erb(:"bookings/find")
end

post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end
