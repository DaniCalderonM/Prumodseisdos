class PsusersController < ApplicationController
  # before_action :set_psuser, only: %i[ show edit update destroy ]
  before_action :authenticate_psuser!
  before_action :is_admin?
  # GET /psposts or /psposts.json
  def index
    @psusers = Psuser.where.not(:id => current_psuser.id)
  end

  # GET /psposts/1 or /psposts/1.json
  def show
    @psuser = Psuser.find(params[:id])
  end

  # GET /psposts/new
  def new
    @psuser = Psuser.new
  end

  # GET /psposts/1/edit
   def edit
    @psuser = Psuser.find(params[:id])
   end

  # POST /psposts or /psposts.json
  def create
    @psuser = Psuser.new(psuser_params)
    # @psuser = current_psuser

    if params[:psuser][:password].blank?
      params[:psuser].delete(:password)
      params[:psuser].delete(:password_confirmation)
    end
    password_setting(@psuser)

    if @psuser.save
      flash[:notice] = "Usuario creado exitosamente."
      redirect_to psusers_path
    else
      flash[:alert] = @psuser.errors.full_messages
      render :action => 'new'
    end
  end
  #   respond_to do |format|
  #     if @psuser.save
  #       format.html { redirect_to psuser_url(@psuser), notice: "Psuser was successfully created." }
  #       format.json { render :show, status: :created, location: @psuser }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @psuser.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /psposts/1 or /psposts/1.json
  def update
    @psuser = Psuser.find(params[:id])
    params[:psuser].delete(:password) if params[:psuser][:password].blank?
    params[:psuser].delete(:password_confirmation) if params[:psuser][:password].blank? and params[:psuser][:password_confirmation].blank?

    if @psuser.update(psuser_params)
      flash[:notice] = "Usuario actualizado con exito."
      redirect_to psusers_path
    else
      respond_to do |format|
        format.html { redirect_to new_psuser_path, alert: @psuser.errors.full_messages }
      end
    end
    # respond_to do |format|
    #   if @psuser.update(psuser_params)
    #     format.html { redirect_to psuser_url(@psuser), notice: "Psuser was successfully updated." }
    #     format.json { render :show, status: :ok, location: @psuser }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @psuser.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /psposts/1 or /psposts/1.json
  def destroy
    @psuser = Psuser.find(params[:id])
    if @psuser.destroy
      flash[:notice] = "Usuario Eliminado con exito."
      redirect_to psusers_path
    end

    # @psuser.destroy
    # respond_to do |format|
    #   format.html { redirect_to psuser_url, notice: "Psuser was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_psuser
    #   @psuser = Psuser.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def psuser_params
      params.require(:psuser).permit(:email, :name, :lastname, :age, :position, :resume, :avatar, psimages: [])
    end

    def password_setting(psuser)
      generated_password = "123456"
  
      psuser.password = generated_password
      psuser.password_confirmation = generated_password
      generated_password
    end

    def is_admin?
      if not current_psuser.admin?
        respond_to do |format|
          format.html { redirect_to psposts_path, alert: "Solo los administradores tiene acceso" }
        end
      end
    end

end
