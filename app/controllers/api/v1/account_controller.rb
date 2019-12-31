class Api::V1::AccountController < ApplicationController
    def create
        userObj = UserAccount.new(user_account_params)
        if userObj.save
            token = JWT.encode({userObj: userObj.id}, ENV["JWTTokenKey"])
            loggedInUserSupportedCampaignObjsArr = Campaign.where(id: CampaignContribution.where(account_id: userObj.id).select(:campaign_id))
            campaignContributionsOjbsArr = CampaignContribution.where(account_id: userObj.id)
            favoritedCampaigns = FavoritedCampaign.where(user_account_id: userObj.id)
            render json: {userObj: userObj, token: token, loggedInUserSupportedCampaignObjsArr: loggedInUserSupportedCampaignObjsArr, campaignContributionsOjbsArr: campaignContributionsOjbsArr, favoritedCampaigns: favoritedCampaigns}
        else
            render json: {errors: userObj.errors.full_messages}
        end
    end

    def login
            userObj = UserAccount.find_by(email_address: params["auth"]["email_address"])
            if userObj && userObj.authenticate(params["auth"]["password"])
            token = JWT.encode({userObj: userObj.id}, ENV["JWTTokenKey"])
            loggedInUserSupportedCampaignObjsArr = Campaign.where(id: CampaignContribution.where(account_id: userObj.id).select(:campaign_id))
            campaignContributionsOjbsArr = CampaignContribution.where(account_id: userObj.id)
            favoritedCampaigns = FavoritedCampaign.where(user_account_id: userObj.id)
            render json: {userObj: userObj, token: token, loggedInUserSupportedCampaignObjsArr: loggedInUserSupportedCampaignObjsArr, campaignContributionsOjbsArr: campaignContributionsOjbsArr, favoritedCampaigns: favoritedCampaigns}
        else
            render json: {errors: userObj.errors.full_messages}
        end 
    end

private

def user_account_params
    params.require(:user_account).permit(:first_name, :last_name, :street, :city, :state, :zip, :country, :cell_phone, :email_address, :password)
end
    
end