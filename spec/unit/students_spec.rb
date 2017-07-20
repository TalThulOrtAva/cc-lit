require_relative 'spec_helper'

describe 'Students' do
  it 'should import students and their scores from a CSV file' do
    file_path = ''
    students = Students.new(file_path)
    expect(students.all).to eq()
  end
end
