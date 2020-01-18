class Api::V1::WishListController < ApplicationController
    def create
        newWishlistItem = WishList.new(wishlistItem_params)
        newWishlistItem.user_id = params[:userID]
        if newWishlistItem.save
            activeUserWishList = WishList.where(user_id: params[:userID])
            render json: { activeUserWishList: activeUserWishList }
        else
            render json: {errors: newWishlistItem.errors.full_messages}
        end
    end

    def update
        
        itemToUpdate = WishList.find(params[:itemIDToUpdate])
        if itemToUpdate.update(giving_user_id: params[:PurchasingUserID])
            if params[:PurchasingUserID] == nil
                itemToUpdate.update(status: "added")
            else
                itemToUpdate.update(status: "marked as purchased")
            end
            eventGettersUserIDsArr = EventGiftGetter.where(event_id: params[:ActiveEventId]).select(:user_id)
            eventGettersUserOBJsArr = User.where(id: eventGettersUserIDsArr)
            eventWishLists = WishList.where(user_id: eventGettersUserIDsArr)
            render json: { eventWishLists: eventWishLists }
        else
            render json: {errors: newWishlistItem.errors.full_messages}
        end
    end

    def destroy
        if WishList.find(params[:wishlistItemID]).destroy
            activeUserWishList = WishList.where(user_id: params[:userID])
            render json: { activeUserWishList: activeUserWishList }
        else
            render json: {errors: newWishlistItem.errors.full_messages}
        end
    end

    def showallforuser
        wishlistItems = WishList.where(user_id: params[:userid])
        render json: wishlistItems
    end


private

def wishlistItem_params
    params.require(:wishlistItem).permit(:gift_name, :amazon_url, :gift_image, :status)
end
    
end