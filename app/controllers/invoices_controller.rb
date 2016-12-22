class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.where(user_id: current_user)
    @orders = Order.where(user_id: current_user)
    @user = current_user
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  def order_update
    respond_to do |format|
      if @order.update(driver_params)
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    redirect_to root_path
  end

  def _bol
    @order = Order.find(params[:order_id])
    @user = User.where(params[:userId])
    @vehicle = Vehicle.where(params[:vehicle_id])
  end

  def _invoice_form
    @order = Order.find(params[:order_id])
    @user = User.where(params[:userId])
    @vehicle = Vehicle.where(params[:vehicle_id])
  end

  def documents
    @order = Order.find(params[:order_id])
    @user = User.where(params[:userId])
    @vehicle = Vehicle.where(params[:vehicle_id])
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:client, :truck_id, :userId, :total, :invoice_items, :dispatchdate)
    end
end
