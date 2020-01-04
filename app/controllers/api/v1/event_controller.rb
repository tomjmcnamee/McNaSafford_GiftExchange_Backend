class Api::V1::EventController < ApplicationController
    def allEventDetails
        eventID = request.headers["EventID"]
        eventGettersUserIDsArr = EventGiftGetter.where(event_id: eventID).select(:user_id)
        eventGettersUserOBJsArr = User.where(id: eventGettersUserIDsArr)
        eventWishLists = WishList.where(user_id: eventGettersUserIDsArr)
        eventInviteesIDs = EventGiftGiver.where(event_id: eventID).select(:user_id)
        eventInviteeObjs = User.where(id: eventInviteesIDs)
        render json: {eventWishLists: eventWishLists, eventGettersUserOBJsArr: eventGettersUserOBJsArr, eventInviteeObjs: eventInviteeObjs}
    end

    def create
        
        newEvent = Event.new(event_params)
        if newEvent.save


    #     loggedInAcct = Account.find_by(email_address: params["auth"]["email_address"].downcase)
    #     if loggedInAcct && loggedInAcct.authenticate(params["auth"]["password"])
    #         token = JWT.encode({loggedInAcct: loggedInAcct.id}, ENV["JWTTokenKey"])
    #         primaryUser = User.find_by(account_id: loggedInAcct.id)
    #         managingUsers = User.where(managing_account_id: loggedInAcct.id)
    #         activeUserWishList = WishList.where(user_id: primaryUser.id)
            activeUserManagedEvents = Event.where(event_managing_user_id: params[:userID])
    #         ##These next three builds the list of Event Objects for which the user is a Gift Giver, and their Getters
    #         activeUserGiftGiver_obj_arr = EventGiftGiver.where(user_id: primaryUser.id).select(:event_id)
    #         activeUserGiftGiverEventIDs = activeUserGiftGiver_obj_arr.map { |event| event.event_id }
    #         activeUserGiverEventOBJsArr = Event.where(id: activeUserGiftGiverEventIDs)
    #         activeUserGiverEventsGetterOBJsArr = EventGiftGetter.where(event_id: activeUserGiftGiverEventIDs)
            
            
            render json: {activeUserManagedEvents: activeUserManagedEvents}
        else
            render json: {status: "error", code: 300, message: "There was a problem creating this event"}
        end
    end

    private

    def event_params
        params.require(:event).permit(:event_name, :event_date, :event_managing_user_id)
    end
    


    
end