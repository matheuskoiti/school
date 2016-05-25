class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :destroy]
	
  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end

  def show
  end

  def create
	@classroom = Classroom.new(classroom_params)

    respond_to do |format|
	  if @classroom.save
	    format.html { redirect_to @classroom, notice: 'Matrícula realizada com sucesso.' }
	    format.json { render :show, status: :created, location: @classroom }
	  else
	    format.html { render :new }
	    format.json { render json: @classroom.errors, status: :unprocessable_entity }
	  end
	end
  end 

  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Matricula foi removida.' }
      format.json { head :no_content }
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:id, :course_id, :student_id)
  end

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end
end
