require_relative "./student.rb"
require_relative "./boatingtest.rb"

class Instructor

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self #ask about correct syntax
  end

  def self.all
    @@all
  end

  def pass_student(student, test_name)
    boating_test_info = BoatingTest.all.find do |test|
      student == test.student && test_name == test.test_name
    end
    if boating_test_info == nil
        BoatingTest.new(student, test_name, "passed", self)
    else
      boating_test_info.test_status = "passed"
    end
  end

  def fail_student(student, test_name)
    boating_test_info = BoatingTest.all.find do |test|
      student == test.student && test_name == test.test_name
    end
    # binding.pry
    if boating_test_info == nil
      BoatingTest.new(student, test_name, "failed", self)
    else
      boating_test_info.test_status = "failed"
    end
  end
Instructor#fail_student should take in a student instance and test name. Like #pass_student, it should try to find a matching BoatingTest and update its status to 'failed'. If it cannot find an existing BoatingTest, it should create one with the name, the matching student, and the status 'failed'.

end
