class Api::V1::EventGiftGiverController < ApplicationController
    def create
        newInvitee = EventGiftGiver.new(event_gift_giver_params)
        if newInvitee.save
            eventInviteesIDs = EventGiftGiver.where(event_id: newInvitee.event_id).select(:user_id)
            eventInviteeObjs = User.where(id: eventInviteesIDs)
            render json: {eventInviteeObjs: eventInviteeObjs}
        else
            render json: {status: "error", code: 300, message: "There was a problem Inviting this user"}
        end
    end

    private

    def event_gift_giver_params
        params.require(:event_gift_giver).permit(:event_id, :user_id)
    end
    


    
end