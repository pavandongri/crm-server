class MeetingsController < ApplicationController
    before_action :authenticate_user!
  
    def create
        meeting = current_user.meetings.build(meeting_params)
        puts(meeting)
        if meeting.save
          render json: meeting, status: :ok
        else
          render json: { error: meeting.errors }, status: :unprocessable_entity
        end
    end
      
    def index
        meetings = current_user.meetings
        render json: meetings, status: :ok
    end      

    def show
        meetings = current_user.meetings.find_by(id: params[:id])
        render json: meetings, status: :ok
    end

    def update
        meeting = current_user.meetings.find_by(id: params[:id])
      
        if meeting
            if meeting.update(meeting_params)
            render json: meeting
            else
            render json: meeting.errors, status: :unprocessable_entity
            end
        else
            render json: { error: 'meeting not found' }, status: :not_found
        end
    end

    
    def destroy
        meeting = current_user.meetings.find_by(id: params[:id])
      
        if meeting
          if meeting.destroy
            render json: { message: 'Meeting successfully deleted' }, status: :ok
          else
            render json: { error: 'Failed to delete meeting' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Meeting not found' }, status: :not_found
        end
      end

      
    private
  
    def meeting_params
      params.require(:meeting).permit(:title, :date, :time, :location, :status, :priority, :duration, :organizer)
    end
  end
  