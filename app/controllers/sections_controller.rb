class SectionsController < ApplicationController

  def index
    @sections = Section.find(:all, :order => 'number')
    render('sections/index.html.erb')
  end

  def show
    section = Section.find(params[:id])
    @section = section
    @next = section.next
    @previous = section.previous
    @lessons = Lesson.where(section_id: @section.id)
    @lessons = @lessons.order('number')
    @lesson = Lesson.new
    render('sections/show.html.erb')
  end

  def new
    @section = Section.new
    render('sections/new.html.erb')
  end

  def create
    @section = Section.new(params[:new_section])
    if @section.save
      redirect_to("/sections/#{@section.id}")
    else
      render('sections/new.html.erb')
    end
  end

 def destroy
    @section_to_destroy = Section.find(params[:id])
    @section_to_destroy.destroy
    redirect_to("/")
  end

  def edit
    @section = Section.find(params[:id])
    render('sections/edit.html.erb')
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(params[:updated_section])
      redirect_to("/sections/#{@section.id}")
    else
      render('sections/new.html.erb')
    end
  end
end

