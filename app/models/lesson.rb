class Lesson < ActiveRecord::Base
  validates :name, :presence => true
  validates :text, :presence => true
  validates :number, :presence => true
  validates :section_id, :presence => true
  belongs_to :section


  def next
   @next = self.number + 1
   @lesson = Lesson.find_by(number: @next)
   @lesson
  end

  def previous
   @previous = self.number - 1
   @lesson = Lesson.find_by(number: @previous)
   @lesson
  end
end
