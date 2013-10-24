class EmergenciesUsersController < ApplicationController
  before_filter :authenticate_system_user!
  layout "private"
  before_filter :set_current_system_user
  # GET /emergencies_users
  # GET /emergencies_users.json
  def index
    @emergency_id = params[:emergency_id]
    @from_index = params[:from_index]
    if !@emergency_id.blank?
      @emergencies_users = EmergenciesUser.joins("INNER JOIN notifications ON emergencies_users.id = notifications.emergencies_users_id").where("notifications.emergencies_id = ?",params[:emergency_id])
    else
      @emergencies_users = EmergenciesUser.get_emergencies_users(params)
    end
    @roles = Role.all  
    @roles = @roles.map { |role| [role.name,role.id] }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @emergencies_users }
    end
  end

  # GET /emergencies_users/1
  # GET /emergencies_users/1.json
  def show
    @emergencies_user = EmergenciesUser.find(params[:id])
    @emergencies_user_role_name = Role.find(@emergencies_user.roles_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @emergencies_user }
    end
  end

  # GET /emergencies_users/new
  # GET /emergencies_users/new.json
  def new
    @emergencies_user = EmergenciesUser.new
    @roles = Role.all  
    @roles = @roles.map { |role| [role.name,role.id] }
    @emergency_types = EmergenciesType.all
    @levels = EmergenciesUser.level_options

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @emergencies_user }
    end
  end

  # GET /emergencies_users/1/edit
  def edit
    @emergencies_user = EmergenciesUser.find(params[:id])
    @roles = Role.all  
    @roles = @roles.map { |role| [role.name,role.id] }
    @emergency_types = EmergenciesType.all
    @levels = EmergenciesUser.level_options
  end

  # POST /emergencies_users
  # POST /emergencies_users.json
  def create
    @emergencies_user = EmergenciesUser.new(params[:emergencies_user])
    @roles = Role.all  
    @roles = @roles.map { |role| [role.name,role.id] }
    @levels = EmergenciesUser.level_options
    respond_to do |format|
      @emergency_types = EmergenciesType.all
      if @emergencies_user.save
        format.html { redirect_to @emergencies_user, notice: 'El usuario fue creado correctamente.' }
      else
        format.html { render action: "new", alert: "El usuario no se pudo crear." }
      end
    end
  end

  # PUT /emergencies_users/1
  # PUT /emergencies_users/1.json
  def update
    @emergencies_user = EmergenciesUser.find(params[:id])
    @roles = Role.all  
    @roles = @roles.map { |role| [role.name,role.id] }
    @levels = EmergenciesUser.level_options
    respond_to do |format|
      if @emergencies_user.update_attributes(params[:emergencies_user])
        format.html { redirect_to @emergencies_user, notice: 'El usuario ha sido modificado exitosamente.' }
      else
        format.html { render action: "edit", alert: "El usuario no se actualizo correctamente." }
      end
    end
  end

  # DELETE /emergencies_users/1
  # DELETE /emergencies_users/1.json
  def destroy
    @emergencies_user = EmergenciesUser.find(params[:id])
    @emergencies_user.destroy

    respond_to do |format|
      format.html { redirect_to emergencies_users_url, notice: "El usuario fue eliminado." }
    end
  end
end
