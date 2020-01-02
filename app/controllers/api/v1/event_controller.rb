class Api::V1::EventController < ApplicationController
    def eventGetterWishlists
        eventID = request.headers["EventID"]
        eventGettersUserIDsArr = EventGiftGetter.where(event_id: eventID).select(:user_id)
        eventGettersUserOBJsArr = User.where(id: eventGettersUserIDsArr)
        eventWishLists = WishList.where(user_id: eventGettersUserIDsArr)
        render json: {eventWishLists: eventWishLists, eventGettersUserOBJsArr: eventGettersUserOBJsArr}
    end

    # def login
    #     loggedInAcct = Account.find_by(email_address: params["auth"]["email_address"].downcase)
    #     if loggedInAcct && loggedInAcct.authenticate(params["auth"]["password"])
    #         token = JWT.encode({loggedInAcct: loggedInAcct.id}, ENV["JWTTokenKey"])
    #         primaryUser = User.find_by(account_id: loggedInAcct.id)
    #         managingUsers = User.where(managing_account_id: loggedInAcct.id)
    #         activeUserWishList = WishList.where(user_id: primaryUser.id)
    #         activeUserManagedEvents = Event.where(event_managing_user_id: primaryUser.id)
    #         ##These next three builds the list of Event Objects for which the user is a Gift Giver, and their Getters
    #         activeUserGiftGiver_obj_arr = EventGiftGiver.where(user_id: primaryUser.id).select(:event_id)
    #         activeUserGiftGiverEventIDs = activeUserGiftGiver_obj_arr.map { |event| event.event_id }
    #         activeUserGiverEventOBJsArr = Event.where(id: activeUserGiftGiverEventIDs)
    #         activeUserGiverEventsGetterOBJsArr = EventGiftGetter.where(event_id: activeUserGiftGiverEventIDs)
            
            
    #         render json: {loggedInAcct: loggedInAcct, token: token, primaryUser: primaryUser, managingUsers: managingUsers, activeUserWishList: activeUserWishList, activeUserManagedEvents: activeUserManagedEvents, activeUserGiverEventOBJsArr: activeUserGiverEventOBJsArr, activeUserGiverEventsGetterOBJsArr: activeUserGiverEventsGetterOBJsArr}
    #     else
    #         render json: {status: "error", code: 300, message: "That Email and PW combination does not exist"}
    #     end
    # end

    
    
end