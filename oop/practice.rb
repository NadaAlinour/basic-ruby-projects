# frozen_string_literal: true

module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :color, :current_speed
  attr_reader :year, :model

  @@number_of_children = 0

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0

    @@number_of_children += 1
  end

  def self.get_number_of_children
    @@number_of_children
  end

  def to_s
    "Your vehicle is a #{color} #{year}'s #{@model}"
  end

  def spray_paint(color)
    self.color = color
    puts "You new #{color} paint job looks fire."
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def age
    puts "your #{model} is #{calculate_age} years old."
  end

  private

  def calculate_age
    # calculate the age of the vehicle
    t = Time.new.year
    t - year
  end
end

class MyCar < Vehicle
  NUM_OF_DOORS = 4
end

class MyTruck < Vehicle
  include Towable
  NUM_OF_DOORS = 2
end

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student)
    grade > student.grade
  end

  protected

  attr_accessor :grade
end

class Dog
  def initialize(name)
    @name = name
  end

  def bark
    puts 'woof woof'
  end
end

class Insect
  def initialize(age_in_days)
    @age_in_days = age_in_days
  end

  def age_in_years
    @age_in_days / 365
  end
end

class Person
  def initialize(age)
    @age = age
  end

  attr_accessor :age
end

ahmad = Person.new(25)
p ahmad
p ahmad.age
p ahmad.age = 26
p ahmad.age
