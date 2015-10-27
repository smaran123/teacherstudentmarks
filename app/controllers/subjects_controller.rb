class SubjectsController < ApplicationController

  def index
  #  @markreport = Markreport.all
  #  @teacher = Teacher.find(params[:id])
     @subjects = Subject.all
  end
  
  def new
    @markreport = Markreport.new
  end
 
 def create
    @markreport = Markreport.new(markreport_params)
    if @markreport.save
      redirect_to subjects_path
    else
      render :new
    end
  end

  def teacherclass

  end

private

def markreport_params
  params.require(:markreport).permit!
end
  
end
