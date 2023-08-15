class PspostsController < ApplicationController
  before_action :set_pspost, only: %i[ show edit update destroy ]
  before_action :authenticate_psuser!
  
  # GET /psposts or /psposts.json
  def index
    @psposts = Pspost.all
  end

  # GET /psposts/1 or /psposts/1.json
  def show
  end

  # GET /psposts/new
  def new
    @pspost = Pspost.new
  end

  # GET /psposts/1/edit
  def edit
  end

  # POST /psposts or /psposts.json
  def create
    @pspost = Pspost.new(pspost_params)

    respond_to do |format|
      if @pspost.save
        format.html { redirect_to pspost_url(@pspost), notice: "Pspost was successfully created." }
        format.json { render :show, status: :created, location: @pspost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pspost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psposts/1 or /psposts/1.json
  def update
    respond_to do |format|
      if @pspost.update(pspost_params)
        format.html { redirect_to pspost_url(@pspost), notice: "Pspost was successfully updated." }
        format.json { render :show, status: :ok, location: @pspost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pspost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psposts/1 or /psposts/1.json
  def destroy
    @pspost.destroy

    respond_to do |format|
      format.html { redirect_to psposts_url, notice: "Pspost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pspost
      @pspost = Pspost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pspost_params
      params.require(:pspost).permit(:title, :description, :psuser_ids, psimages: [])
    end
end
