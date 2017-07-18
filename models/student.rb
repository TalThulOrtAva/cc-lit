require_relative 'errors'
require 'pry'

class Student
  attr_accessor :name, :scores

  VALID_SCORES = %w(k 1 2 3 4 5 6 7 8)

  def initialize(name, scores = {})
    raise InvalidTestScore if (scores.values.select{|score| VALID_SCORES.include? score}).empty? && scores != {}

    @name = name
    @scores = scores
  end
end