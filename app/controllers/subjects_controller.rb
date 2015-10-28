class SubjectsController < ApplicationController

def index
@markreports = Markreport.all
  @teacherclass = Teacherclass.where(teacher_id=current_user.id).all
 
end
  

 #  def new
 #    @markreport = Markreport.new
 #  end
 
 # def create
 #    @markreport = Markreport.new(markreport_params)
 #    if @markreport.save
 #      redirect_to subjects_path
 #    else
 #      render :new
 #    end
 #  end

  def teacherclass
    @markreport = Markreport.new
    respond_to do |format|
      format.js
    end
  end

def teacherclass_marks
  @markreport = Markreport.new(markreport_params)
  if @markreport.save
    redirect_to subjects_path
  else
    render :action => teacherclass
end
end

private

def markreport_params
  params.require(:markreport).permit!
end
  
end
