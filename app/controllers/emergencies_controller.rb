class EmergenciesController < ApplicationController
  layout "application"
  before_filter :set_current_system_user
  
  # GET /emergencies
  # GET /emergencies.json
  def index
    @emergencies = Emergency.get_emergencies(params[:actual], params)
    @emergencies_types = EmergencyType.all   
    @emergencies_types = @emergencies_types.map { |emergencies_type| [emergencies_type.name,emergencies_type.id] }
    respond_to do |format|
      format.html {render  :action => "index" , :layout => "private"} # index.html.erb
    end
  end

  def reported_emergency
    @emergency = Emergency.get_emergencies(params[:actual], params).first
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit_state_emergency
    @emergency = Emergency.find(params[:id])
    respond_to do |format|
      format.html {render  :action => "edit_state_emergency" , :layout => "private"} # edit.html.erb
    end
  end

  # GET /emergencies/1
  # GET /emergencies/1.json
  def show
    @emergency = Emergency.find(params[:id])
    respond_to do |format|
      format.html {render  :action => "show" , :layout => "private"} # show.html.erb
      format.json { render json: @emergency }
    end
  end

  # GET /emergencies/new
  # GET /emergencies/new.json
  def new
    @emergency = Emergency.new
    @emergencies_types = EmergencyType.all    
    @emergencies_types = @emergencies_types.map { |emergencies_type| [emergencies_type.name,emergencies_type.id] }
    @cities = City.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @emergency }
    end
  end

  # GET /emergencies/1/edit
  def edit
    @emergency = Emergency.find(params[:id])
  end

  # POST /emergencies
  # POST /emergencies.json
  def create
    @emergency = Emergency.new(params[:emergency])
    @emergency.status = Emergency::STATUS[:registered]
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    code = (0...50).map{ o[rand(o.length)] }.join
    @emergency.code = code
    @emergency.neighborhood_id = params[:neighborhood_id]
    respond_to do |format|
      if @emergency.save
        format.html { redirect_to "/emergencies/show_code?code=#{code}", notice: 'La emergencia fue creada correctamente.' }
      else
        format.html { render action: "new", alert: "No se pudo crear la emergencia." }
      end
    end
  end

  def show_code
    @code = params[:code]
  end

  # PUT /emergencies/1
  # PUT /emergencies/1.json
  def update
    @emergency = Emergency.find(params[:id])
    if params[:emergency][:status].to_i == Emergency::STATUS[:revised]
      @emergency.revised_date = Time.now
    elsif params[:emergency][:status].to_i == Emergency::STATUS[:reported]
      @emergency.reported_date = Time.now
    end
        
    respond_to do |format|
      if @emergency.save and @emergency.update_attributes(params[:emergency])
        format.html { redirect_to @emergency, notice: 'El estado fue actualizado.', :layout => 'private' }
      else
        format.html { render action: "edit", notice: 'No se pudo actualiar la emergencia.', :layout => 'private' }
      end
    end
  end

  # DELETE /emergencies/1
  # DELETE /emergencies/1.json
  def destroy
    @emergency = Emergency.find(params[:id])
    @emergency.archived = true
    @emergency.save

    respond_to do |format|
      format.html { redirect_to emergencies_url, notice: "La emergencia fue eliminada." }
    end
  end

  def cancel
    @emergency = Emergency.find(params[:emergency_id])
    @emergency.emergency_end = Time.now
    @emergency.status = Emergency::STATUS[:canceled]
    respond_to do |format|
      if @emergency.save
        notifications = Notification.where("emergencies_id = ?", @emergency.id)
      	notifications.each do |n|
      		n.status = Emergency::STATUS[:canceled]
      		n.save
      	end
        format.html { redirect_to emergencies_path(:actual => params[:actual]), notice: 'La emergencia fue cancelada.' }
      else

        format.html { render action: "new", notice: 'No se pudo cancelar la emergencia.' }
      end
    end
  end
end
