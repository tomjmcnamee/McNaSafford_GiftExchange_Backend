class Api::V1::AccountController < ApplicationController
    def create
        newAcct = Account.new(account_params)
        if newAcct.save
            token = JWT.encode({userObj: newAcct.id}, ENV["JWTTokenKey"])
            newUser = User.new(user_params)
            newUser.account_id = newAcct.id
            newUser.save
            render json: {loggedInAcct: newAcct, token: token, primaryUser: newUser}
        else
            render json: {errors: newAcct.errors.full_messages}
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

def user_params
    params.require(:user).permit(:first_name, :last_name, :dob)
end

def account_params
    params.require(:account).permit(:email_address, :password)
end
    
end