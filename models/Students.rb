require 'CSV'

class Students < Array

  def initialize(file_path, delimiter)
    read_file(file_path, delimiter)
  end

  def name_search(name)
    self.select{|student| student.name == name}
  end

  private

  def read_file(file_path, delimiter)
    raw_data = CSV::parse(File.open(file_path).read, headers: true, col_sep: delimiter).to_a
    create_students(raw_data)
  end

  def create_students(raw_data)
    headers = raw_data.shift
    raw_data.map!{|student| Hash[headers.zip(student)]}
    raw_data.each{|student| self << Student.new(student.delete('Student Name'), student)}
  end
end
