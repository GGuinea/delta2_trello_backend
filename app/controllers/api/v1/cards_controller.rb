module Api
  module V1
  class CardsController < ApplicationController
    before_action :authorized

    def add_to_board
      @column = Column.find_by(id: params[:column_id])
      @card = @column.cards.create(card_params)
      if @card.save
        render json: @card, status: :created
      else
        render json: @card.errors_full_message, status: :unprocessable_entity
      end
      
    end

    def update_card 
      @card = Card.find_by(id: params[:id]) 
      if @card.update_attributes(card_params)
        render json: @card, status: :accepted
      else
        render json: @card.errors_full_message, statu: :not_found
      end
    end

    def remove_card 
      @card = Card.find_by(id: params[:id])
      if @card.destroy
        render :nothing => true, status: :ok
      else
        render :nothing => true, status: :not_found
      end
    end

    def get_cards_for_column
      @column  = Column.find_by(id: params[:column_id])
      @cards = @column.cards
      render json: @cards, status: :ok
    end

    def card_params 
      params.permit(
        :name,
        :description,
        :deadline
      )
    end

  end
 end
end
