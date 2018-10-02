require_relative( '../db/sql_runner' )

class Booking

  attr_reader :id, :member_id, :gym_class_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @member_id = options['member_id'].to_i
    @gym_class_id = options['gym_class_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (member_id, gym_class_id)
    VALUES($1, $2)
    RETURNING id"
    values = [@member_id, @gym_class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def update()
    sql = "UPDATE bookings SET (member_id, gym_class_id) = ($1, $2) WHERE id = $3"
    values = [@member_id, @gym_class_id, @id]
    SqlRunner.run(sql, values)
  end

  def member()
    sql = "SELECT * FROM members WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run(sql, values)
    return Member.new(results.first())
  end

  def gym_class()
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [@gym_class_id]
    results = SqlRunner.run(sql, values)
    return Gym_Class.new(results.first())
  end

  def self.delete_all()
    sql = "DELETE FROM bookings"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    results = SqlRunner.run(sql)
    booking = results.map {|booking| Booking.new(booking)}
  end

  def self.find(id)
    sql = "SELECT * FROM bookings WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    booking = Booking.new(results.first())
    return booking
  end

  def self.delete(id)
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
