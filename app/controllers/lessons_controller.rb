class LessonsController < ApplicationController
  def index
    @lessons = Lesson.find(:all, :order => 'number')
    render('lessons/index.html.erb')
  end

  def show
    lesson = Lesson.find(params[:id])
    @section = Section.find(lesson.section.id)
    @lesson = lesson
    @next = lesson.next
    @previous = lesson.previous
    render('lessons/show.html.erb')
  end

  def new
    @lesson = Lesson.new
    render('lessons/new.html.erb')
  end

  def create
    @lesson = Lesson.new(params[:new_lesson])
    if @lesson.save
      redirect_to("/lessons/#{@lesson.id}")
    else
      render('lessons/new.html.erb')
    end
  end

  def destroy
    @lesson_to_destroy = Lesson.find(params[:id])
    @lesson_to_destroy.destroy
    redirect_to("/")
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(params[:updated_lesson])
      redirect_to("/lessons/#{@lesson.id}")
    else
      render('lessons/new.html.erb')

    end
  end

end
