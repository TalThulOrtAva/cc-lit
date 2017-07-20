require_relative 'spec_helper'

describe 'Students' do
  it 'should import students and their scores from a CSV file' do
    file_path = 'spec/fixtures/student_tests.csv'
    students = Students.new(file_path, ',')
    expect(students.name_search('Christopher Hayes')[0].scores).to eq({'RF' => '5', 'RL' => '5', 'RI' => 'K', 'L' => '2'})
  end
end
