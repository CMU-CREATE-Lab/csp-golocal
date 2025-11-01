class ManagedFilesController < ApplicationController
  before_action :set_managed_file, only: %i[ show edit update destroy ]

  # GET /managed_files or /managed_files.json
  def index
    @managed_files = ManagedFile.all
  end

  # GET /managed_files/1 or /managed_files/1.json
  def show
  end

  # GET /managed_files/new
  def new
    @managed_file = ManagedFile.new
  end

  # GET /managed_files/1/edit
  def edit
  end

  # POST /managed_files or /managed_files.json
  def create
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
