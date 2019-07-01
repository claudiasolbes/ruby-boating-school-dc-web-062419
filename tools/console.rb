require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

spongebob = Student.new("Spongebob")
patrick= Student.new("Patrick")

puff= Instructor.new("Ms.Puff")
krabs= Instructor.new("Mr.Krabs")

no_crashing = spongebob.add_boating_test("Don't Crash 101", "pending", puff)
power_steering_failure = patrick.add_boating_test("Power Steering 202", "failed", puff)
power_steering_pass = patrick.add_boating_test("Power Steering 201", "passed", krabs)

#grade_percentage should return the percentage of tests that the student has passed, a Float (so if a student has passed 3 / 9 tests that they've taken, this method should return the Float 33.33)

puts "Adds a boating test"
# puts spongebob.add_boating_test("Don't Crash 101", "pending", puff).class == BoatingTest # why does this return 'true'
p BoatingTest.all.first
puff.pass_student(spongebob, "Don't Crash 101")
p BoatingTest.all.first

p BoatingTest.all
krabs.fail_student(patrick, "Power Steering 201")
p BoatingTest.all[2]
# puts "Patrick has passed 50% of tests?"
# puts patrick.grade_percentage == 50.00
# student.all.each {|student| student.name == name}
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
