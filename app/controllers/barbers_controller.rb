class BarbersController < ApplicationController
    before_action :set_trainer, only: [:show, :edit, :update, :destroy]
  
    # GET /trainers
    # GET /trainers.json
    def index
      @barbers = Barber.all
    end
  
    # GET /trainers/1
    # GET /trainers/1.json
    def show
    end
  
    # GET /trainers/new
    def new
      @barber = Barber.new
    end
  
    # GET /trainers/1/edit
    def edit
    end
  
    # POST /trainers
    # POST /trainers.json
    def create
      @barber = Barber.new(barber_params)
  
      respond_to do |format|
        if @trainer.save
          format.html { redirect_to @barber, notice: 'Barber was successfully created.' }
          format.json { render :show, status: :created, location: @barber }
        else
          format.html { render :new }
          format.json { render json: @barber.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /trainers/1
    # PATCH/PUT /trainers/1.json
    def update
      respond_to do |format|
        if @barber.update(barber_params)
          format.html { redirect_to @barbers, notice: 'Barber was successfully updated.' }
          format.json { render :show, status: :ok, location: @barber }
        else
          format.html { render :edit }
          format.json { render json: @barber.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /trainers/1
    # DELETE /trainers/1.json
    def destroy
      @barber.destroy
      respond_to do |format|
        format.html { redirect_to barbers_url, notice: 'Barber was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_barber
        @barber = Barber.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def barber_params
        params.require(:barber).permit(:photo, :first_name, :last_name, :user_id, :account_id)
      end
    end
end