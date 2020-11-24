class SessionsController < ApplicationController
    
    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:error] = "Wrong Password!"
            redirect_to login_path
        end
    end

    def omniauth 
        @user = User.find_or_create_by_google(auth)
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
end
