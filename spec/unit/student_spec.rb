require_relative 'spec_helper'

describe Student do
  let(:name) { 'Stacy' }
  let(:scores) { { RF: 'K', RL: '1', RI: '4', L:'5' } }
  let(:student) { Student.new(name, scores) }

  describe '#new' do
    it 'knows its name' do
      expect(student.name).to eq name
    end

    it 'maps and returns scores accurately' do
      scores.each { |attr| expect(attr[1]).to eq student.scores[attr[0]] }
    end

    it 'does not require any scores' do
      maxie = Student.new('Maxine')
      expect(maxie.name).to eq 'Maxine'
    end

    it 'can accept any sting as a domain' do
      alt_scores = { GHOST_LIT: 'K', VAMPIRE_LIT: '1', fanfics: '5', CM460: '8', RF: '6'}
      ava = Student.new('Ava', alt_scores)
      alt_scores.each { |attr| expect(attr[1]).to eq ava.scores[attr[0]] }
    end

    it 'limits scoring to k-8' do
      alt_scores = { RF: 'K', RL: '9', RI: '-1', L: 'HHH'}
      expect { Student.new('Mary', alt_scores) }.to raise_error InvalidTestScore
    end

    it 'should not create a record without a name' do
      expect { Student.new() }.to raise_error StandardError
    end
  end
end