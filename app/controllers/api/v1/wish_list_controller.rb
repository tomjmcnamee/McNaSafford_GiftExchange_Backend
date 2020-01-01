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