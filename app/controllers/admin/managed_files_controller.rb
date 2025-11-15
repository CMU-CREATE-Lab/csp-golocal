class Admin::ManagedFilesController < ApplicationController

  layout "application_back"

  def index
    authorize! :manage, ManagedFile
    @managed_files = ManagedFile.all
    #render :inline => "Admin::ManagedFilesController"
  end

end
