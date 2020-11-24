class UsersController < ApplicationController

    #before_action :set_haircut, only: [:new]

    
    def index
        @users = User.all 
    end

    def new
        @user = User.new 
        @account = Account.new
        @client = Client.new
        @schedules = Schedule.where('start >= ? and start <=  ?', Date.today + 1.day, Date.today + 2.weeks).where(title: 'Available').order('start ASC').all
    end     

    def create 
        create_client_account  
        @user = User.new(user_params)
        @user.account_id = @account.id

        if @user.save 
            flash[:message] = "Profile Created"
            redirect_to user_path(@user)
        else
            flash[:error] = "Please try again"
            render 'new'
        end
    end
    end

    def show 
        @user = User.find_by_id(params[:id])
    end

    private

    def set_haircut
        @haircut = Haircut.find(params[:haircut_id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def create_client_account
        @account = Account.new
        @account.save
    end

    def create_client_profile
        @client = Client.new
        #binding.pry
        @client.first_name = params[:user][:name]
        @client.user_id = @user.id
        @client.account_id = @user.account_id
        @client.save
    end
      
    def create_client_booking
        #@haircut = Haircut.find(params[:user][:booking][:haircut_id])
        @booking = Booking.new
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
