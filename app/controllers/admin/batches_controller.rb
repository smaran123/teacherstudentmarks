class Admin::BatchesController < ApplicationController
 layout :get_admin_layout
 
 def new
    #  @admin = Admin.find(params[:admin_id])
    @batch = Batch.new
    #    1.times {@batch.subjects.build}
    if @batch.subjects.blank?
      @batch.subjects.build
    end
  end
  
  def index
   # @batches = Batch.where("admin_id = #{current_admin.id}")
   @batches = Batch.all
 end
 
 def create
    # @admin = Admin.find(params[:admin_id])
    @batch = Batch.new(batch_params)
   # @batch.admin_id = current_admin.id
   if @batch.save
    flash[:notice] = "class is created"
    redirect_to admin_batches_path
  else
    flash[:error] = "Failed to Send Invitation"
    render :action => 'new'
  end
end


def edit
    @batch = Batch.find(params[:id])
end

def update
  @batch = Batch.find(params[:id])
  if @batch.update(batch_params)
    redirect_to admin_batches_path
  else
    render :edit
  end
end

def display_subjects
  
  @batch = Batch.find(params[:batch_id])
  if !@batch.blank?
    @subjects = @batch.subjects.all
  end
  respond_to do |format|
    format.js
  end
end

def destroy
  @batch = Batch.find(params[:id])
  if @batch.destroy
    redirect_to admin_batches_path
  end
end  

private

def batch_params
  params.require(:batch).permit!
end



end
