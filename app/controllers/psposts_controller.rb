class PspostsController < ApplicationController
  before_action :set_pspost, only: %i[ show edit update destroy ]
  before_action :authenticate_psuser!
  before_action only: [ :create, :new, :destroy, :edit, :update ] do
    authorize_request(["admin"])
  end
  # GET /psposts or /psposts.json
  def index
    @psposts = Pspost.all
  end

  # GET /psposts/1 or /psposts/1.json
  def show
    mark_notifications_as_read
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
        format.html { redirect_to pspost_url(@pspost), notice: "La publicación fue creada con exito." }
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
        format.html { redirect_to pspost_url(@pspost), notice: "La publicación se actualizo con exito." }
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
      format.html { redirect_to psposts_url, notice: "La publicación fue eliminada con exito." }
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
      params.require(:pspost).permit(:title, :description, psimages: [])
    end

    def mark_notifications_as_read
      if current_psuser
        notifications_to_mark_as_read = @pspost.notifications_as_pspost.where(recipient: current_psuser)
        notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
      end
    end


end
