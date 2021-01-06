module Api
  module V1
  class LabelsController < ApplicationController
    before_action :authorized

    def create_for_board
      @board = Board.find_by(id: params[:board_id])
      @label = @board.labels.create(label_params)
      if @label.save
        render json: @label, status: :created
      else
        render json: @label.errors.full_messages, status: :unprocessable_entity
      end
    end

    def get_labels_for_board
      @board = Board.find_by(id: params[:board_id])
      if @board
        render json: @board.labels, status: :created
      else
        render json: @board.errors.full_messages, status: :unprocessable_entity
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

    #For specific card
    def add_label_to_card
      @card = Card.find_by(id: params[:card_id])
      @label = Label.find_by(id: params[:label_id])
      @existingAssociation = CardsLabel.find_by(card_id: @card.id, label_id: @label.id)

      if @existingAssociation
        render :nothing => true, status: :conflict
        return
      end

      if @card && @label
        @association = CardsLabel.create(card_id: @card.id, label_id: @label.id)
        render json: @card.as_json(include: :labels), status: :created
      else
        render json: @card.errors.full_messages, status: :unprocessable_entity
      end
    end

    def remove_label 
      @card = Card.find_by(id: params[:card_id])
      @label = Label.find_by(id: params[:label_id])
      if @card && @label
        @card.labels.delete(@label)
        render :nothing => true, status: :ok
      else
        render :nothing => true, status: :not_found
      end
    end

    def label_params
      params.permit(
        :name,
        :color,
      )
    end

  end
 end
end
