require_relative( '../db/sql_runner' )

class Gym_Class

  attr_reader :id, :class_name, :class_description
  attr_accessor :class_time, :class_instructor, :class_spaces

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @class_name = options['class_name']
    @class_description = options['class_description']
    @class_time = options['class_time']
    @class_instructor = options['class_instructor']
    @class_spaces = options ['class_spaces'].to_i
  end


  def save()
    sql = "INSERT INTO gym_classes
    (class_name, class_description, class_time, class_instructor, class_spaces)
    VALUES($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@class_name, @class_description, @class_time, @class_instructor, @class_spaces]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE gym_classes SET (class_name, class_description, class_time, class_instructor, class_spaces) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@class_name, @class_description, @class_time, @class_instructor, @class_spaces ]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run(sql)
    gym_class = results.map {|gym_class|Gym_Class.new(gym_class)}
  end

  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    gym_class = Gym_Class.new(results.first())
    return gym_class
  end

  def self.delete(id)
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
