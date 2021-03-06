class StudiesController < ApplicationController
  before_action :set_study, only: [:show, :edit, :update, :destroy]

  def index
    @studies = Study.all
  end

  def show

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

  end

  def update
    @study.update(study_params)
     # Will raise ActiveModel::ForbiddenAttributesError. Use method study_params to allow user access

    # no need for app/views/restaurants/create.html.erb
    redirect_to study_path #why use parameter (@study)
  end

  def destroy
    @study.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to studies_path
  end

  private

  def study_params
    params.require(:study).permit(:title, :description, :recruiting)
  end

  def set_study
    @study = Study.find(params[:id])
  end
end
