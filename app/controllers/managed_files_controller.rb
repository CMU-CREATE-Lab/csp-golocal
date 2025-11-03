class ManagedFilesController < ApplicationController
  before_action :set_managed_file, only: %i[ show edit update destroy ]

  def show_from_filename
    managed_file = ManagedFile.find_by(name: params[:name])
    if managed_file and managed_file.file.attached?
      redirect_to rails_blob_url(managed_file.file, disposition: "attachment")
    else
      #head :not_found
      redirect_to '/'
    end
  end

  def show_from_stream
    managed_file = ManagedFile.find_by(name: params[:name])
    if managed_file and managed_file.file.attached?
      send_data managed_file.file.download,
                filename: managed_file.file.filename.to_s,
                type: managed_file.file.content_type,
                disposition: "inline" # or "attachment"
    else
      #head :not_found
      redirect_to '/'
    end
  end

  # GET /managed_files or /managed_files.json
  def index
    authorize! :read, ManagedFile
    @managed_files = ManagedFile.all
  end

  # GET /managed_files/1 or /managed_files/1.json
  def show
    authorize! :read, ManagedFile
  end

  # GET /managed_files/new
  def new
    authorize! :create, ManagedFile
    @managed_file = ManagedFile.new
  end

  # GET /managed_files/1/edit
  def edit
    authorize! :update, ManagedFile
  end

  # POST /managed_files or /managed_files.json
  def create
    authorize! :create, ManagedFile
    @managed_file = ManagedFile.new(managed_file_params)

    respond_to do |format|
      if @managed_file.save
        format.html { redirect_to managed_file_url(@managed_file), notice: "Managed file was successfully created." }
        format.json { render :show, status: :created, location: @managed_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @managed_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managed_files/1 or /managed_files/1.json
  def update
    authorize! :update, ManagedFile
    respond_to do |format|
      if @managed_file.update(managed_file_params)
        format.html { redirect_to managed_file_url(@managed_file), notice: "Managed file was successfully updated." }
        format.json { render :show, status: :ok, location: @managed_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @managed_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managed_files/1 or /managed_files/1.json
  def destroy
    authorize! :destroy, ManagedFile
    @managed_file.destroy

    respond_to do |format|
      format.html { redirect_to managed_files_url, notice: "Managed file was successfully destroyed." }
      format.json { head :no_content }
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
