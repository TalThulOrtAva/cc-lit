class PathGenerator
  attr_reader :domain_order, :student, :path

  def initialize(domain_order, student)
    @domain_order = domain_order
    @student = student
    @path = generate_path
  end

  private

  def generate_path
    return domain_order.flat_path[0..4] if student.scores.empty?

    learning_path = domain_order.flat_path

    student.scores.each do |score|
      grade_level = score[1]

      next if grade_level == 'K' # a grade of K doesn't alter the lesson order
      max_level_to_delete = score[1].to_i - 1
      learning_path.reject! { |lesson| /([0-#{max_level_to_delete}]|K)\.#{score[0].to_s}/.match(lesson) }
    end

    learning_path[0..4]
  end
end
