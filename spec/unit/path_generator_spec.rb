require_relative 'spec_helper'

describe 'PathGenerator' do
  let(:domain_order_cc) { DomainOrder.new('spec/fixtures/domain_order_standard.csv', ',') }
  let(:domain_order_alt) { DomainOrder.new('spec/fixtures/domain_order_abnormal.csv', ',') }
  let(:scores) { { RF: 'K', RL: '1', RI: '4', L:'5' } }

  it 'should generate a literature path given a student and a domain order' do
    student = Student.new('Stacy', scores)
    pathgen = PathGenerator.new(domain_order_cc, student)
    expect(pathgen.path).to eq(%w(K.RF 1.RF 1.RL 2.RF 2.RL))
  end

  it 'should pick the first five assignments if the student has no scores' do
    student = Student.new('Garfield')
    pathgen = PathGenerator.new(domain_order_cc,student)
    expect(pathgen.path).to eq(%w(K.RF K.RL K.RI 1.RF 1.RL))
  end

  it 'should be able to utilize non-traditional domain pathing' do
    student = Student.new('Nerd', { GHOSTS: '2', FANFIC: 'K', STORIES_ABOUT_DOGS: '2', MARY_POTTER: '5', VAMPIRE: '5' } )
    pathgen = PathGenerator.new(domain_order_alt,student)
    expect(pathgen.path).to eq(%w(K.FANFIC, 2.FANFIC, 2.GHOST_NONFICTION, 2.STORIES_ABOUT_DOGS, 3.STORIES_ABOUT_DOGS))
  end
end
