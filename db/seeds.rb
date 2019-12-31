# # # # If the DB is populated, but you want to wipe it out to start with a fresh seeding, 
# # # # run the below command first:
# # # #       "rails db:migrate:reset"  
# # # # This will drop all, create the DB (with all tables), then remigrate all.\
# # * Database creation
# #   #$   rails db:create
# #   #$   rails db:migrate
# #   #$   rails db:seed



puts "create Accounts - Start"
Account.create!(email_address: "tom@12345.com", password: "12345")
Account.create!(email_address: "bill@12345.com", password: "12345")
Account.create!(email_address: "melanie@12345.com", password: "12345")
puts "create Accounts - End"

puts "create Users - Start"
User.create!(first_name: "Tom", last_name: "McNamee", dob: "1980-09-17", account_id: 1)
User.create!(first_name: "Bill", last_name: "Safford", dob: "1980-09-17", account_id: 2)
User.create!(first_name: "Melanie", last_name: "McNamee", dob: "1980-12-1", account_id: 3)
User.create!(first_name: "Violet", last_name: "McNamee", dob: "2016-1-26", managing_account_id: 3)
User.create!(first_name: "Gwendolyn", last_name: "McNamee", dob: "2018-5-30", managing_account_id: 3)
puts "create Users - End"

puts 'create Event - Start'
Event.create!(event_name: "V's Birthday Party", event_date: "2020-01-26", event_managing_user_id: 3)
puts 'create Event - End'

puts 'create EventGiftGetter - Start'
EventGiftGetter.create!(user_id: 4, event_id: 1)
puts 'create EventGiftGetter - End'

puts 'create EventGiftGiver - Start'
EventGiftGiver.create!(user_id: 1, event_id: 1)
EventGiftGiver.create!(user_id: 3, event_id: 1)
EventGiftGiver.create!(user_id: 5, event_id: 1)
puts 'create EventGiftGiver - End'

puts 'create WishList - Start'
WishList.create!(user_id: 4, gift_name: "Alexa Dot", amazon_url: "https://www.amazon.com/dp/B07FZ8S74R/ref=ods_gw_d_ha_h1_cpt_party_122919?pf_rd_p=626cbc60-0211-45bd-bbea-083ff29ec327&pf_rd_r=PBZ78KJCN940QHCW5XMW")
WishList.create!(user_id: 4, gift_name: "Marbles", amazon_url: "https://www.amazon.com/Marbles-Players-Shooters-Assorted-Finishes/dp/B01CZ0IQ3K/ref=sr_1_2?keywords=marbles&qid=1577768249&s=amazon-devices&sr=1-2-catcorr")
puts 'create WishList - End'