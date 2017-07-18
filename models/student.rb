require_relative 'errors'

class Student
  attr_accessor :name, :scores

  VALID_SCORES = %w(k 1 2 3 4 5 6 7 8)

  def initialize(name, scores = {})
    scores.values.map{|score| raise InvalidTestScore unless VALID_SCORES.include? score}

    @name = name
    @scores = scores
  end
end
