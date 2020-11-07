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
      @board = Board.new(board_params) 
      if @board.save
        render json: @board, status: :created
      else
        render json: @board.errors.full_messages, status: :unprocessable_entity
      end
    end

    def board_params
      params.permit(
        :name
      )
    end

  end
 end
end
