class SystemUsersController < ApplicationController
  before_filter :authenticate_system_user!
  layout "private"
  before_filter :set_current_system_user
  # GET /system_users
  # GET /system_users.json
  def index
    @system_users = SystemUser.where("id != ?", current_system_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @system_users }
    end
  end

  # GET /system_users/1
  # GET /system_users/1.json
  def show
    @system_user = SystemUser.find(params[:id])
    @my_self_user = params[:my_self_user]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system_user }
    end
  end

  # GET /system_users/new
  # GET /system_users/new.json
  def new
    @system_user = SystemUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system_user }
    end
  end

  # GET /system_users/1/edit
  def edit
    @my_self_user = params[:my_self_user]
    @system_user = SystemUser.find(params[:id])
  end

  # POST /system_users
  # POST /system_users.json
  def create
    @system_user = SystemUser.new(params[:system_user])

    respond_to do |format|
      if @system_user.save
        format.html { redirect_to @system_user, notice: 'El usuario fue creado correctamente.' }
      else
        format.html { render action: "new", alert: "El usuario no se pudo crear." }
      end
    end
  end

  # PUT /system_users/1
  # PUT /system_users/1.json
  def update
    @system_user = SystemUser.find(params[:id])
    respond_to do |format|
      if @system_user.update_attributes(params[:system_user])
        format.html { redirect_to system_user_path(@system_user,:my_self_user => params[:my_self_user]),  notice: 'El usuario ha sido modificado exitosamente.' }
      else
        format.html { render action: "edit",  alert: "El usuario no se actualizo correctamente." }
      end
    end
  end

  # DELETE /system_users/1
  # DELETE /system_users/1.json
  def destroy
    @system_user = SystemUser.find(params[:id])
    @system_user.destroy

    respond_to do |format|
      format.html { redirect_to system_users_url, notice: "El usuario fue eliminado." }
    end
  end

   #GET
  def password
    @system_user = SystemUser.find_by_id(params[:id])
  end
    
  #POST
  def reset_password
    @system_user = SystemUser.find_by_id(params[:id])
    @system_user.password = params[:password]
    @system_user.password_confirmation = params[:password_confirmation]
    
    #SystemUser.skip_callback(:save, :after, :asign_activation_user_id)
    if !@system_user.save
      format.html { render :action => "password" }
    elsif(@system_user.id == current_system_user.id)
      flash[:notice] = "La contrasena se cambio correctamente."
      sign_in @system_user, :bypass => true
      redirect_to system_user_path(@system_user, :my_self_user => true)
    else
      flash[:notice] = "La contrasena se cambio correctamente."
      redirect_to system_user_path(@system_user)
    end
    #SystemUser.set_callback(:save, :after, :asign_activation_user_id)
  end

end
