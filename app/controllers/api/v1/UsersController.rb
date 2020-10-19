module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all();
        render json: {status: 'SUCCESS', message:'Loaded users', data:users},status: :ok
      end
    end
  end
end
