class Section < ActiveRecord::Base
  validates :name, :presence => true
  validates :number, :presence => true
  has_many :lessons

  def next
    @next = self.number + 1
    @section = Section.find_by(number: @next)
    @section
  end

  def previous
    @previous = self.number - 1
    @section = Section.find_by(number: @previous)
    @section
  end
end
