require_relative 'spec_helper'

describe 'from csv to final output of student lesson plans' do

  it 'should import s student csv and a domain_order csv and output a per-student lesson plan' do
    example_output = CSV::parse(File.open('spec/fixtures/sample_solution.csv').read, headers: false, col_sep: ',')

    domain_order_file_path = 'spec/fixtures/domain_order_standard.csv'
    student_file_path = 'spec/fixtures/student_tests.csv'
    domain_order = DomainOrder.new(domain_order_file_path, ',')
    students = Students.new(student_file_path,',')

    lesson_plans = []
    students.each do |student|
      lesson_plans << [student.name] + PathGenerator.new(domain_order, student).path
    end

    expect(lesson_plans).to eq(example_output)
  end
end
