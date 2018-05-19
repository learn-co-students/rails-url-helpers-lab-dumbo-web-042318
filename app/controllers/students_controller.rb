class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate]

  def index
    @students = Student.all
  end

  def show
  end


  def activate
    @student = Student.find(params[:id])
    if @student.active == false
      @student.update(active: true)
      @student.save
    else
      @student.update(active: false)
      @student.save
    end


    if @student.save
      redirect_to student_path(@student)
    else
      redirect_to students_path
    end
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
