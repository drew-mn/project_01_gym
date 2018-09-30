require_relative('../db/sql_runner')

class Member

  attr_reader :id
  attr_accessor :first_name, :last_name, :email

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @email = options['email']
  end

  def full_name()
      return "#{@first_name} #{@last_name}"
    end

  def save()
    sql = "INSERT INTO members
    (first_name, last_name, email)
    VALUES
    ($1, $2, $3)
    RETURNING *"
    values = [@first_name, @last_name, @email]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i
  end

  def update()
    sql = "UPDATE members
    SET
    (first_name, last_name, email) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @email]
    SqlRunner.run(sql, values)
  end

  # def classes()
  #   sql = "SELECT gym_classes.*
  #   FROM gym_classes
  #   INNER JOIN bookings
  #   ON gym_classes.id = bookings.gym_classes_id
  #   WHERE gym_classes.member_id = $1"
  #   values = [@id]
  #   gym_class_data = SqlRunner.run(sql, values)
  #   return GymClass.map(gym_class_data)
  # end

  def number_of_members()
    return members().count
  end

  # def book_gym_class(booking)
  #   gym_class = booking.gym_class
  #   price = film.price
  #   return unless screening.empty_seats > 0
  #   return unless customer_can_afford_film?(price)
  #   Ticket.new('customer_id' => @id, 'screening_id' => screening.id).save()
  #   @funds -= price
  #   screening.sell_ticket()
  #   update()
  # end

  def self.delete_all()
  sql = "DELETE FROM members"
  SqlRunner.run(sql)
end

def self.all()
  sql = "SELECT * FROM members"
  results = SqlRunner.run(sql)
  member_data = results.map{|member|Member.new(member)}
end

def self.find(id)
  sql = "SELECT * FROM members WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  member = Member.new(results.first())
  return member
end

def self.delete(id)
  sql = "DELETE FROM members WHERE id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end

end
