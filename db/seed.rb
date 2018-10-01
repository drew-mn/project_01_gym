# require( 'sinatra' )
# require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative('../models/gym_class')
require_relative('../models/member')
require_relative('../models/booking')

gym_class1 = Gym_Class.new({
  'class_name' => 'Spin',
  'class_description' => 'Get in the saddle and take a fitness journey that will keep you toned and burn calories.',
  'class_time' => '09:00',
  'class_instructor' => 'Dave',
  'class_spaces' => 5})

gym_class2 = Gym_Class.new({
  'class_name' => 'FT Fit',
  'class_description' => 'FT Fit uses a range of movements and equipment to help you get fit.',
  'class_time' => '10:00',
  'class_instructor' => 'Billy',
  'class_spaces' => 5})

gym_class3 = Gym_Class.new({
  'class_name' => 'Core Stability',
  'class_description' => 'A great workout to increase overall balance and posture, and give you flexibility.',
  'class_time' => '12:00',
  'class_instructor' => 'Laura',
  'class_spaces' => 5})

gym_class4 = Gym_Class.new({
  'class_name' => 'Kettlebells',
  'class_description' => 'Kettlebells work on improving your shape and strength while burning calories.',
  'class_time' => '14:00',
  'class_instructor' => 'Kelly',
  'class_spaces' => 5})

gym_class5 = Gym_Class.new({
  'class_name' => 'Metafit',
  'class_description' => 'Metafit combines aerobic exercise with the latest interval training techniques for fast results.',
  'class_time' => '16:00',
  'class_instructor' => 'Dave',
  'class_spaces' => 5})

gym_class1.save
gym_class2.save
gym_class3.save
gym_class4.save
gym_class5.save


member1 = Member.new({
  'first_name' => 'Drew',
  'last_name' => 'Neillie',
  'email' => "drew.neillie@live.co.uk"})

member2 = Member.new({
  'first_name' => 'Lauren',
  'last_name' => 'France',
  'email' => "lauren@hotmail.co.uk"})

member3 = Member.new({
  'first_name' => 'Judith',
  'last_name' => 'Anderson',
  'email' => "judith@hotmail.co.uk"})

member4 = Member.new({
  'first_name' => 'Colin',
  'last_name' => 'McCulloch',
  'email' => "colin@hotmail.co.uk"})

member5 = Member.new({
  'first_name' => 'Graham',
  'last_name' => 'Walker',
  'email' => "graham@hotmail.co.uk"})

member6 = Member.new({
  'first_name' => 'Gerard',
  'last_name' => 'Bush',
  'email' => "gerard@hotmail.co.uk"})

member1.save
member2.save
member3.save
member4.save
member5.save
member6.save

# binding.pry
# nil
