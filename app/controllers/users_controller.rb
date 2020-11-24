class UsersController < ApplicationController

    #before_action :set_haircut, only: [:new]

    def new
        @account = Account.new
        @user = User.new 
        @client = Client.new
        @booking = Booking.new
        @schedules = Schedule.where('start >= ? and start <=  ?', Date.today + 1.day, Date.today + 2.weeks).where(title: 'Available').order('start ASC').all
    end     

    def create 
        create_client_account  
        @user = User.new(user_params)
        @user.account_id = @account.id
        
        respond_to do |format|
          if @user.save
            create_client_profile
            create_client_booking
            create_client_lesson_payment
            auto_login(@user)
            format.html { redirect_to dashboard_url, notice: 'Your account was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { redirect_back fallback_location: root_path, alert: 'An error occurred while sending this request.' }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
    end

    #def create 
    #    @user = User.new(user_params)
    #    if @user.save 
    #        session[:user_id] = @user.id 
    #        redirect_to user_path(@user)
    #    else
    #        render :new 
    #    end
    #end

    def show 
        @user = User.find_by_id(params[:id])
    end

    def index
        @user = User.all 
    end

    private

    def set_haircut
        @haircut = Haircut.find(params[:haircut_id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def create_client_account
        @account = Account.new()
        @account.status = 'active'
        @account.account = 'prefix-' + SecureRandom.hex(4)
        @account.account_type = 'client'
        @account.save
    end

    def create_client_profile
        @client = Client.new()
        @client.firstname = params[:user][:client][:firstname]
        @client.lastname = params[:user][:client][:lastname]
        @client.user_id = @user.id
        @client.account_id = @user.account_id
        @client.save
    end
      
    def create_client_booking
      @haircut = Haircut.find(params[:user][:booking][:haircut_id])
      @booking = Booking.new()
      @booking.haircut_id = params[:user][:booking][:haircut_id]
      @booking.schedule_id = params[:user][:booking][:schedule_id]
      @booking.client_id = @client.id
      @booking.account_id = @user.account_id
      @booking.status = 'Booked'
      @booking.save
      @schedule = Schedule.find(params[:user][:booking][:schedule_id])
      @booking.barber_id = @schedule.barber_id 
      @booking.start = @schedule.start 
      @booking.save
      @schedule.title = 'Booked'
      @schedule.save
    end
end
