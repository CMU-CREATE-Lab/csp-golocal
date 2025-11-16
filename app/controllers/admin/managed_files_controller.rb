class Admin::ManagedFilesController < ApplicationController

  # before_action :reuse_views, only: %i[ new edit ]
  before_action :set_managed_file, only: %i[ show edit update destroy ]
  layout "application_back"

  def index
    authorize! :manage, ManagedFile
    @managed_files = ManagedFile.all
    #render :inline => "Admin::ManagedFilesController"
  end

  def destroy
    authorize! :manage, ManagedFile
    @managed_file = ManagedFile.find(params[:id])
    @managed_file.destroy

    respond_to do |format|
      format.html { redirect_to admin_files_path, notice: "Managed file was successfully destroyed." }
    end
  end


  def new
    authorize! :create, ManagedFile
    @managed_file = ManagedFile.new
  end


  def edit
    authorize! :update, ManagedFile
  end


  def create
    authorize! :create, ManagedFile
    @managed_file = ManagedFile.new(managed_file_params)

    respond_to do |format|
      if @managed_file.save
        format.html { redirect_to admin_files_path, notice: "Managed file was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def update
    authorize! :update, ManagedFile
    respond_to do |format|
      if @managed_file.update(managed_file_params)
        format.html { redirect_to admin_files_path, notice: "Managed file was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managed_file
      @managed_file = ManagedFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def managed_file_params
      params.require(:managed_file).permit(:name, :file)
    end
end
