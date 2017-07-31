class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @plan = start_plan
    if @plan.total_point< 30
      redirect_to plan_path(session[:plan_id]),
      notice: "Total ECTS scores less than 30.
               You've got: #{@plan.lists.to_a.length}
               classes = #{@plan.total_point} ECTS"
      return
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
   @order = Order.new(order_params)
   @plan = start_plan
   
   @order.add_lists_from_plan(@plan)
   respond_to do |format|
     if @order.save
       #Plan.destroy(session[:plan_id])
       #session[:plan_id] = nil
       #BookClasses.received(@order).deliver
       format.html { redirect_to root_path, notice: 'Order was successfully created.' }
       format.json { render action: 'show', status: :created, location: @order }
     else
       format.html { render action: 'new' }
       format.json { render json: @order.errors, status: :unprocessable_entity }
     end
   end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:first_name, :second_name, :email)
    end
end
