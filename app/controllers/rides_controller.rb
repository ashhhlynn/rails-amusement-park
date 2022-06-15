class RidesController < ApplicationController

    before_action :set_ride, only: %i[ show edit update destroy ]

    def create
        ride = Ride.new(ride_params)
        if ride.take_ride == true
            ride.save
            notice = "Thanks for riding the #{ride.attraction.name}!"
            redirect_to user_path(ride.user), notice: notice
        else

            notice = ride.take_ride
            redirect_to user_path(ride.user), notice: notice
           # raise params.inspect 
        end


    end

      private

    def ride_params
        params.require(:ride).permit(
        :user_id,
        :attraction_id
        )
    end

    def set_ride
        @ride = Ride.find(params[:id])
      end

end