module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized, only:[:auto_login, :all_boards]

      #Register
      def create
        @user = User.create(user_params)
        if @user.valid?
          WelcomeMailer.welcome_email(@user).deliver
          render json: {userId: @user.id, status: "Registered"}, status: :ok
        else
          render json: {error: "Cannot create new user, email/username already exists"}, status: :conflict
        end
      end

      #log in
      def login
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
          token = encode_token({user_id: @user.id}, Time.now.to_i + 3600) # 60 min
          render json: {userId: @user.id, token: token}, status: :ok
        else
          render json: {error: "Invalid username or password"}, status: :not_found
        end
      end

      def auto_login
        render json: {greetings: "Hello " + @user.username} 
      end

      def all_boards
        @boards = @user.boards
        render json: @boards.as_json(include: {
          users: {
            only: [:id, :username, :email]
          }
        }), status: :ok
      end

      private

      def user_params
        params.permit(:username, :password, :email)
      end

    end
  end
end
