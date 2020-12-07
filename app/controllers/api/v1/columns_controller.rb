module Api
  module V1
  class ColumnsController < ApplicationController
    before_action :authorized

    def index 
      @columns = Column.all()
      render json: @columns, status: :ok
    end

    def create
      @board = Board.find_by(id: params[:board_id])
      @column = @board.columns.create(column_params)
      if @column.save
        render json: @column, status: :created
      else
        render json: @column.errors.full_messages, status: :unprocessable_entity
      end
    end

    def get_columns_for_board
      @board = Board.find_by(id: params[:board_id])
      @columns = @board.columns
      render json: @columns.as_json(include: :cards), status: :ok
    end

    def update_column
      @column = Column.find_by(id: params[:id])
      if @column.update_attributes(column_params)
        render json: @column, status: :accepted
      else
        render json: @column.errors.full_messages, status: :not_found
      end
    end

    def remove_column
      @column = Column.find_by(id: params[:id])
      if @column.destroy
        render json: {status: "removed"}, status: :ok
      else
        render json: @column.errors.full_messages, status: :not_found
      end
    end

    def column_params
      params.permit(
        :name,
      )
    end

  end
 end
end
