require 'CSV'
require 'pry'

class DomainOrder
  attr_reader :path

  def initialize(file_path, delimiter)
    @path = read_file(file_path, delimiter)
  end
end

private

def read_file(file_path, delimiter)
  raw_data = CSV::parse(File.open(file_path).read, headers: false, col_sep: delimiter)
  add_prefixes(raw_data).flatten
end

def add_prefixes(raw_data)
  raw_data.map! do |domain|
    prefix = "#{domain.shift}."
    domain.map { |lesson| "#{prefix}#{lesson}" }
  end
end
