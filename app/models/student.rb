require_relative "./instructor.rb"
require_relative "./boatingtest.rb"

class Student

  @@all = []

  attr_reader :first_name

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end

  def self.find_student(first_name)
    self.all.find {|student| student.first_name == first_name}
  end

  def all_tests
    BoatingTest.all.select {|test| test.student == self}
  end

  def grade_percentage
    # "passed test" / all_test.size
    passed_tests = all_tests.select {|test| test.test_status == "passed"}
    passed_tests.size.to_f / all_tests.size.to_f
  end
end
