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
    binding.pry
    {}
  end
end