class Admin::ManagedFilesController < ApplicationController

  layout "application_back"

  def index
    authorize! :manage, ManagedFile
    @managed_files = ManagedFile.all
    #render :inline => "Admin::ManagedFilesController"
  end

  def edit
    authorize! :manage, ManagedFile
    @managed_file = ManagedFile.find(params[:id])
    render :inline => "Admin::ManagedFilesController.edit"
  end

  def destroy
    authorize! :manage, ManagedFile
    @managed_file = ManagedFile.find(params[:id])
    @managed_file.destroy

    respond_to do |format|
      format.html { redirect_to admin_files_path, notice: "Managed file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

end
