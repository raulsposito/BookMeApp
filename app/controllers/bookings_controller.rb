class BookingsController < ApplicationController
    before_action :authentication_required

    def new 
        @booking = Booking.new
    end

    def index
        @bookings = Booking.where("user_id" => current_user.id )
    end

    def next_week
        @bookings = Booking.all.next_week.where("user_id" => current_user.id )
    end

    def show
        @booking = Booking.find_by_id(params[:id])
    end

    def create 
        #@booking = current_user.bookings.build(bookings_params)

        @booking = Booking.new(bookings_params)
        @booking.status = 'Booked'
        if @booking.save 
            redirect_to bookings_path
        else 
            render :new 
        end
    end

    private 

    def bookings_params
        params.require(:booking).permit(:date, :barber_id, :status)
    end

end
