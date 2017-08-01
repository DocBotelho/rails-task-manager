class StudiesController < ApplicationController
  def index
    @studies = Study.all
  end

  def show
    @study = Study.find(params[:id])
  end

  def new
    @study = Study.new
  end

  def create
    @study = Study.new(study_params)
    @study.save
    # Will raise ActiveModel::ForbiddenAttributesError. Use method study_params to allow user access

    # no need for app/views/restaurants/create.html.erb
    redirect_to study_path(@study) #why use parameter (@study)
  end

  def edit
    @study = Study.find(params[:id])
  end

  def update
    @study = Study.find(params[:id])
    @study.update(study_params)
     # Will raise ActiveModel::ForbiddenAttributesError. Use method study_params to allow user access

    # no need for app/views/restaurants/create.html.erb
    redirect_to study_path #why use parameter (@study)
  end

  def destroy
    @study = Study.find(params[:id])
    @study.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to studies_path
  end

  private

  def study_params
    params.require(:study).permit(:title, :description, :recruiting)
  end

end
