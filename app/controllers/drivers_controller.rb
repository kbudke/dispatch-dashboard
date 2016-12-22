class DriversController < ApplicationController
  before_action :set_driver, only: [:edit, :update, :destroy, :show]
  before_action :all_drivers, only: [:index, :update, :create, :destroy]
  before_action :authenticate_user!


  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  def show
    set_driver
  end

  # GET /drivers/1/edit
  def edit
  end

  def go_back
    redirect_to :drivers
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = Driver.create(driver_params)
    @user = current_user
    @driver.set_user!(current_user)
    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver.destroy
    respond_to do |format|
      format.html { redirect_to drivers_url, notice: 'Driver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    def all_drivers
      @drivers = Driver.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:driver_name, :driver_id, :driver_dob, :driver_address, :email, :phone_number, :trailer_capacity, :image)
    end
end
