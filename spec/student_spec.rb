require 'rspec'

describe Student do
  let(:name) { 'Stacy' }
  let(:scores) { { RF: 'k', RL: '1', RI: '4', L:5 } }
  let(:student) { Student.new(name, scores) }

  describe '#new' do
    it 'maps and returns scores accurately' do
      scores.each { |attr| expect(attr[1]).to eq customer1.send(attr[0]) }
    end

    it 'knows its name' do
      expect(student.name).to eq name
    end

    it 'should not create a record without a name' do
      expect { Student.new({}) }.to raise_error StandardError
    end
  end
end