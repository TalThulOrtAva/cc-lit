require_relative 'spec_helper'

describe 'DomainOrder' do

  it 'should import a domain order from a CSV file' do
    file_path = 'spec/fixtures/domain_order_standard.csv'
    domain_order = DomainOrder.new(file_path, ',')
    expect(domain_order.flat_path).to eq %w(K.RF K.RL K.RI
                                       1.RF 1.RL 1.RI
                                       2.RF 2.RI 2.RL 2.L
                                       3.RF 3.RL 3.RI 3.L
                                       4.RI 4.RL 4.L
                                       5.RI 5.RL 5.L
                                       6.RI 6.RL)
  end
end
