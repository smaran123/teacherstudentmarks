class SubjectsController < ApplicationController

  def index
    @markreports = Markreport.all
    @teacherclass = Teacherclass.where(teacher_id=current_user.id).all
    @markreport = Markreport.new

  end
  


  def teacherclass
    @markreport = Markreport.new
    @subject = Subject.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

def teacherclass_marks
   @subject = Subject.find_by_id(params[:id])
   @markreport = Markreport.create(markreport_params.merge(:subject => @subject))
      respond_to do |format|
      format.js
    end
  end

private

def markreport_params
  params.require(:markreport).permit!
end

end
