class Api::V1::UserController < ApplicationController
    def switchUser
        activeUserWishList = WishList.where(user_id: params[:userid])
        activeUserManagedEvents = Event.where(event_managing_user_id: params[:userid])
        ##These next three builds the list of Event Objects for which the user is a Gift Giver, and their Getters
        activeUserGiftGiver_obj_arr = EventGiftGiver.where(user_id: params[:userid]).select(:event_id)
        activeUserGiftGiverEventIDs = activeUserGiftGiver_obj_arr.map { |event| event.event_id }
        activeUserGiverEventOBJsArr = Event.where(id: activeUserGiftGiverEventIDs)
        activeUserGiverEventsGetterOBJsArr = EventGiftGetter.where(event_id: activeUserGiftGiverEventIDs)
        render json: {activeUserWishList: activeUserWishList, activeUserManagedEvents: activeUserManagedEvents, activeUserGiverEventOBJsArr: activeUserGiverEventOBJsArr, activeUserGiverEventsGetterOBJsArr: activeUserGiverEventsGetterOBJsArr}
    end

    def login
        loggedInAcct = Account.find_by(email_address: params["auth"]["email_address"].downcase)
        if loggedInAcct && loggedInAcct.authenticate(params["auth"]["password"])
            token = JWT.encode({loggedInAcct: loggedInAcct.id}, ENV["JWTTokenKey"])
            primaryUser = User.find_by(account_id: loggedInAcct.id)
            managingUsers = User.where(managing_account_id: loggedInAcct.id)
            activeUserWishList = WishList.where(user_id: primaryUser.id)
            activeUserManagedEvents = Event.where(event_managing_user_id: primaryUser.id)
            ##These next three builds the list of Event Objects for which the user is a Gift Giver, and their Getters
            activeUserGiftGiver_obj_arr = EventGiftGiver.where(user_id: primaryUser.id).select(:event_id)
            activeUserGiftGiverEventIDs = activeUserGiftGiver_obj_arr.map { |event| event.event_id }
            activeUserGiverEventOBJsArr = Event.where(id: activeUserGiftGiverEventIDs)
            activeUserGiverEventsGetterOBJsArr = EventGiftGetter.where(event_id: activeUserGiftGiverEventIDs)
            
            
            render json: {loggedInAcct: loggedInAcct, token: token, primaryUser: primaryUser, managingUsers: managingUsers, activeUserWishList: activeUserWishList, activeUserManagedEvents: activeUserManagedEvents, activeUserGiverEventOBJsArr: activeUserGiverEventOBJsArr, activeUserGiverEventsGetterOBJsArr: activeUserGiverEventsGetterOBJsArr}
        else
            render json: {status: "error", code: 300, message: "That Email and PW combination does not exist"}
        end
    end

    
    
end