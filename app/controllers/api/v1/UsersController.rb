module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized, only:[:auto_login, :all_boards]

      #Register
      def create
        @user = User.create(user_params)
        if @user.valid?
          token = encode_token({user_id: @user.id})
          render json: {userId: @user.id, status: "Registered"}
        else
          render json: {error: "Cannot create new user, email/username already exists"}
        end
      end

      #log in
      def login
        @user = User.find_by(username: params[:username])

        if @user && @user.password == params[:password]
          WelcomeMailer.welcome_email(@user).deliver
          token = encode_token({user_id: @user.id})
          render json: {userId: @user.id, token: token}
        else
          render json: {error: "Invalid username or password"}
        end
      end

      def auto_login
        render json: {greetings: "Hello " + @user.username} 
      end

      def all_boards
        @boards = @user.boards
        render json: {baords: @boards}
      end

      private

      def user_params
        params.permit(:username, :password, :email)
      end

    end
  end
end
