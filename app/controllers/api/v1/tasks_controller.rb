module Api
  module V1
  class TasksController < ApplicationController
    before_action :authorized

    def add_to_card
      @card = Card.find_by(id: params[:card_id])
      @task = @card.tasks.create(tasks_params)
      if @task.save
        render json: @task, status: :created
      else
        render json: @task.errors_full_message, status: :unprocessable_entity
      end
    end

    def update_task
      @task = Task.find_by(id: params[:id])
      if @task.update(tasks_params)
        render json: @task, status: :created
      else
        render :nothing => true, status: :not_found
      end
    end

    def remove_task
      @task = Task.find_by(id: params[:id])
      if @task.destroy
        render :nothing => true, status: :ok
      else
        render :nothing => true, status: :not_found
      end
    end
  
    def get_tasks_for_card
      @card = Card.find_by(id: params[:card_id])
      @tasks = @card.tasks
      render json: @tasks, status: :ok
    end

    def tasks_params
      params.permit(
        :name,
        :done
      )
    end
  end
 end
end
