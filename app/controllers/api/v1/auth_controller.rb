class Api::V1::AuthController < ApplicationController
    def create
        # byebug
        token = request.headers["Authorization"]
        userId = JWT.decode(token, ENV["JWTTokenKey"])[0]["userObj"]
        userObj = UserAccount.find(userId)
        
        render json: {}

    end

    def login
        userObj = UserAccount.find_by(email_address: params["auth"]["email_address"])
        if userObj && userObj.authenticate(params["auth"]["password"])
            loggedInUserSupportedCampaignObjsArr = Campaign.where(id: CampaignContribution.where(account_id: userObj.id).select(:campaign_id))
            campaignContributionsOjbsArr = CampaignContribution.where(account_id: userObj.id)
            token = JWT.encode({userObj: userObj.id}, ENV["JWTTokenKey"])
            favoritedCampaigns = FavoritedCampaign.where(user_account_id: userObj.id)
            render json: {userObj: userObj, token: token, loggedInUserSupportedCampaignObjsArr: loggedInUserSupportedCampaignObjsArr, campaignContributionsOjbsArr: campaignContributionsOjbsArr, favoritedCampaigns: favoritedCampaigns}
        else
            render json: {status: "error", code: 300, message: "That Email and PW combination does not exist"}
        end
    end

    
    
end