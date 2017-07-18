require_relative 'spec_helper'

context 'DomainOrder' do
  let(:domain_order) { DomainOrder.new("K,RF,RL,RI\n1,RF,RL,RI") }

  specify 'should do something' do

    true.should == false
  end
end