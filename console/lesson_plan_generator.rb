require_relative '../models/student'
require_relative '../models/students'
require_relative '../models/path_generator'
require_relative '../models/domain_order'
require_relative '../models/errors'

puts 'Generating lesson plans using "domain_order.csv" and "student_tests.csv" in the data/ directory.'
puts 'What would you like to name the file? (Do not include the .csv extension)'
output_file_name = gets.chomp

students = Students.new('data/student_tests.csv', ',')
domain_order = DomainOrder.new('data/domain_order.csv', ',')
lesson_plans = []
students.each do |student|
  lesson_plans << [student.name] + PathGenerator.new(domain_order, student).path
end

CSV.open("data/#{output_file_name}.csv", 'wb') do |csv|
  lesson_plans.each{|lesson_plan| csv << lesson_plan}
end

puts "File written at data/#{output_file_name}."