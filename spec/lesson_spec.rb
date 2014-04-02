require 'spec_helper'

describe Lesson do
  it { should validate_presence_of :name }
  it { should validate_presence_of :text }
  it { should validate_presence_of :number }
  it { should validate_presence_of :section_id }
  it { should belong_to :section }
end

describe '.next' do

  it 'returns the next lesson' do
    current_lesson = Lesson.create({:name => 'lesson1', :text => 'first lesson!', :number => 1, :section_id => 1})
    next_lesson = Lesson.create({:name => 'lesson2', :text => 'second lesson!', :number => 2, :section_id => 1})
    current_lesson.next.should eq next_lesson
  end

  it 'returns the previous lesson' do
    current_lesson = Lesson.create({:name => 'lesson2', :text => 'second lesson!', :number => 2, :section_id => 1})
    previous_lesson = Lesson.create({:name => 'lesson1', :text => 'first lesson!', :number => 1, :section_id => 1})
    current_lesson.previous.should eq previous_lesson
  end

end

