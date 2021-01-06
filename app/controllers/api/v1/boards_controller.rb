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
        @board.labels.create(name: "", color: "red")
        @board.labels.create(name: "", color: "green")
        @board.labels.create(name: "", color: "blue")
        @board.labels.create(name: "", color: "yellow")
        @board.labels.create(name: "", color: "orange")
        render json: @board.as_json(include: :labels), status: :created
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
    def update_board 
      @board = Board.find_by(id: params[:id])
      if @board.update(board_params)
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

    def add_member
      @board = Board.find_by(id: params[:id])
      @newUser = User.find_by(member_by_email_params)
      @exisitngMember = Member.find_by(board_id: @board.id, user_id: @newUser.id)

      if @exisitngMember
        render :nothing => true, status: :conflict
        return
      end

      if @newUser && @board
        @member = Member.create(board_id: @board.id, user_id: @newUser.id)
        render json: @member, status: :ok
      else
        render json: @newUser.errors_full_message, status: :not_found
      end
    end

    def add_member_by_id
      @board = Board.find_by(id: params[:board_id])
      @newUser = User.find_by(id: params[:user_id])
      @exisitngMember = Member.find_by(board_id: @board.id, user_id: @newUser.id)

      if @exisitngMember
        render :nothing => true, status: :conflict
        return
      end

      if @newUser && @board
        @member = Member.create(board_id: @board.id, user_id: @newUser.id)
        render json: @member, status: :ok
      else
        render json: @newUser.errors_full_message, status: :not_found
      end
      
    end

    def remove_member
      @board = Board.find_by(id: params[:board_id])
      @newUser = User.find_by(id: params[:user_id])
      if @board && @newUser
        @board.users.delete(@newUser)
        render :nothing => true, status: :ok
      else
        render :nothing => true, status: :not_found
      end
    end

    def get_board
      @board = Board.find_by(id: params[:id])

      if @board
        render json: @board.as_json(include: {users: {
          only: [:id, :username, :email]
        }},
        include: {labels: {
          only: [:id, :name, :color_id]
        }}), status: :ok
      else
        render :nothing => true, status: :not_found 
      end
    end

    def member_by_email_params
      params.permit(
        :email
      )
    end

    def board_params
      params.permit(
        :name,
        :description,
        :backgroud_id
      )
    end

  end
 end
end
