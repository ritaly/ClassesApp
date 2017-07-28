class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize
  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
     @plan = start_plan
     lecture = Lecture.find(params[:lecture_id])
     curent_lecture = @plan.lists.find_by(lecture_id: lecture)

     if curent_lecture
       redirect_to lectures_url, notice: "You can't add this lecture again, choose sth else"
     else
          @list = @plan.lists.build(:lecture => lecture)
           respond_to do |format|
             if @list.save
               format.html { redirect_to @list.plan, notice: 'Lecture was successfully added.' }
               format.json { render action: 'show', status: :created, location: @list }
             else
               format.html { render action: 'new' }
               format.json { render json: @list.errors, status: :unprocessable_entity }
             end
           end
     end
  end


  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:lecture_id, :plan_id)
    end
end
