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
  @gym_classes = Gym_Class.all
  erb (:"bookings/index")
end

get '/bookings/new' do
  @booking = Booking.all
  @member = Member.all
  @gym_class = Gym_Class.all
  erb(:"bookings/new")
end

post '/bookings' do
  @booking = Booking.new(params)
  @booking.save
  erb(:"bookings/create")
end

get '/bookings/:id' do
  @booking = Booking.find(params[:id])
  erb(:"bookings/show")
end

# get '/bookings/:id/edit' do
#   @booking = Booking.find(params[:id])
#   erb(:"bookings/edit")
# end
#
# post '/bookings/:id' do
#   Booking.new(params).update()
#   redirect to '/bookings'
# end



post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end
