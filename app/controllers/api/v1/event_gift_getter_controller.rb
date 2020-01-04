class Api::V1::EventGiftGetterController < ApplicationController
    def create
        newGiftGetter = EventGiftGetter.new(event_gift_getter_params)
        if newGiftGetter.save
            eventGiftGettersIDs = EventGiftGetter.where(event_id: newGiftGetter.event_id).select(:user_id)
            eventGettersUserOBJsArr = User.where(id: eventGiftGettersIDs)
            render json: {eventGettersUserOBJsArr: eventGettersUserOBJsArr}
        else
            render json: {status: "error", code: 300, message: "There was a problem adding this gift getter"}
        end
    end

    private

    def event_gift_getter_params
        params.require(:event_gift_getter).permit(:event_id, :user_id)
    end
    


    
end