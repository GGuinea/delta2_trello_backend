module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized, only:[:auto_login]

      #Register
      def create
        @user = User.create(user_params)
        if @user.valid?
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Cannot create new user, email/username already exists"}
        end
      end

      #log in
      def login
        @user = User.find_by(username: params[:username])

        if @user && @user.password == params[:password]
          token = encode_token({user_id: @user.id})
          render json: {user: @user, token: token}
        else
          render json: {error: "Invalid username or password"}
        end
      end

      def auto_login
        render json: {data: "Logged it!"} 
      end

      private

      def user_params
        params.permit(:username, :password)
      end

    end
  end
end
