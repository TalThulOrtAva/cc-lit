require_relative 'spec_helper'

describe 'PathGenerator' do
  let(:domain_order) { DomainOrder.new("K,RF,RL,RI\n1,RF,RL,RI") }
  let(:scores) { { RF: 'k', RL: '1', RI: '4', L:'5' } }
  let(:student) { Student.new('Stacy', scores) }
  let(:pathgen) { PathGenerator.new(domain_order, student)}

  it 'should ' do

    true.should == false
  end
end