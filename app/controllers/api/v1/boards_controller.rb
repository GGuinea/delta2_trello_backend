module Api
  module V1
  class BoardsController < ApplicationController
    before_action :authorized

    #GET /api/v1/boards
    def index 
      @boards = Board.all()
      render json: @boards, status: :ok
    end

    #POST /api/v1/boards
    def create
      #@board = Board.new(board_params)
      @board = @user.boards.create(board_params)
      if @board.save
        render json: @board, status: :created
      else
        render json: @board.errors.full_messages, status: :unprocessable_entity
      end
    end

    #GET /get_usesrs/<board-id>
    def get_users
      @board = Board.find_by(id: params[:id])
      @users = @board.users.select("id", "username")

      render json: @users, status: :ok
    end

    #PATCH /api/v1/board/<board-id>
    def change_name
      @board = Board.find_by(id: params[:id])
      if @board.update(change_name_params)
        render json: @board, status: :accepted
      else
        render json: @board.errors.full_messages, status: :not_found
      end
    end

    def remove_board
      @board = Board.find_by(id: params[:id])
      if @board.destroy
        render json: {status: "removed"}, status: :ok
      else
        render json: @board.errors.full_messages, status: :not_found
      end
    end

    def change_name_params
      params.permit(
        :name
      )
    end

    def board_params
      params.permit(
        :name,
        :description
      )
    end

  end
 end
end
