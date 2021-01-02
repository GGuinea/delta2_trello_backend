module Api
  module V1
  class LabelsController < ApplicationController
    before_action :authorized

    def create
      @board = Board.find_by(id: params[:board_id])
      @label = @board.labels.create(label_params)
      if @label.save
        render json: @label, status: :created
      else
        p "tedst"
        render json: @label.errors.full_messages, status: :unprocessable_entity
      end
    end

    def update_label
      @lable = Label.find_by(id: params[:id])
      if @label.update_attributes(label_params)
        render json: @label, status: :accepted
      else
        render json: @label.errors.full_messages, status: :not_found
      end
    end

    def remove_label_from_board 
      @label = Label.find_by(id: params[:id])
      if @label.destroy
        render json: {status: "removed"}, status: :ok
      else
        render json: @label.errors.full_messages, status: :not_found
      end
    end

    def label_params
      params.permit(
        :name,
        :color_id,
      )
    end

  end
 end
end
