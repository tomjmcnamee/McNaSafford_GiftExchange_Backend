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
Event.create!(event_name: "McNamee Christmas Party", event_date: "2020-12-25", event_managing_user_id: 3)
puts 'create Event - End'

puts 'create EventGiftGetter - Start'
EventGiftGetter.create!(user_id: 4, event_id: 1)
EventGiftGetter.create!(user_id: 1, event_id: 2)
EventGiftGetter.create!(user_id: 3, event_id: 2)
EventGiftGetter.create!(user_id: 4, event_id: 2)
EventGiftGetter.create!(user_id: 5, event_id: 2)
puts 'create EventGiftGetter - End'

puts 'create EventGiftGiver - Start'
EventGiftGiver.create!(user_id: 1, event_id: 1)
EventGiftGiver.create!(user_id: 2, event_id: 1)
EventGiftGiver.create!(user_id: 3, event_id: 1)
EventGiftGiver.create!(user_id: 5, event_id: 1)
EventGiftGiver.create!(user_id: 1, event_id: 2)
EventGiftGiver.create!(user_id: 3, event_id: 2)
EventGiftGiver.create!(user_id: 4, event_id: 2)
EventGiftGiver.create!(user_id: 5, event_id: 2)
puts 'create EventGiftGiver - End'

puts 'create WishList - Start'
WishList.create!(user_id: 1, gift_name: "Drumsticks", amazon_url: "https://www.amazon.com/Specials-Promark-Hickory-Drumsticks-3-pack/dp/B06X9WGS11/ref=sr_1_1_sspa?keywords=drumsticks&qid=1577827924&s=electronics&sr=1-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExWEtFSUY3OUJGNDUwJmVuY3J5cHRlZElkPUEwMjQ5OTgwMzhLN0NDVkY1TUpZTyZlbmNyeXB0ZWRBZElkPUEwMTg3NzY3M0FTTzlGMlpVVU1BNSZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=", gift_image: "https://images-na.ssl-images-amazon.com/images/I/81XraG1w-uL._AC_SL1500_.jpg")
WishList.create!(user_id: 1, gift_name: "Drum kit", amazon_url: "https://www.amazon.com/Alesis-Nitro-Electronic-Snare-Cymbals/dp/B07BW1XJGP/ref=pd_bxgy_267_img_2/147-7280305-9066417?_encoding=UTF8&pd_rd_i=B07BW1XJGP&pd_rd_r=94660ff6-a7ba-4207-8bd6-f8d28689f4af&pd_rd_w=8jYOp&pd_rd_wg=za0ZT&pf_rd_p=09627863-9889-4290-b90a-5e9f86682449&pf_rd_r=GZB4Y3Z4MXMDCBJX26HH&psc=1&refRID=GZB4Y3Z4MXMDCBJX26HH", gift_image: "https://images-na.ssl-images-amazon.com/images/I/719%2BzJepvTL._AC_SL1500_.jpg")
WishList.create!(user_id: 2, gift_name: "Callaway Golf Balls", amazon_url: "https://www.amazon.com/Callaway-Supersoft-Balls-Dozen-Finish/dp/B07M6GKHVR/ref=sr_1_6?dchild=1&keywords=golf&qid=1577894560&s=toys-and-games&sr=1-6", gift_image: "https://images-na.ssl-images-amazon.com/images/I/515Czn42fOL._AC_SL1000_.jpg")
WishList.create!(user_id: 2, gift_name: "Golf Tees", amazon_url: "https://www.amazon.com/Pride-Professional-Tee-System-ProLength/dp/B0055NRJLA/ref=pd_bxgy_img_2/147-7280305-9066417?_encoding=UTF8&pd_rd_i=B0055NRJLA&pd_rd_r=c8612ab9-9864-4f58-9ede-2f7b8b02d5aa&pd_rd_w=gpNqR&pd_rd_wg=rWI7J&pf_rd_p=09627863-9889-4290-b90a-5e9f86682449&pf_rd_r=C15XZ4FF7BJ6QF7QAW54&psc=1&refRID=C15XZ4FF7BJ6QF7QAW54", gift_image: "https://images-na.ssl-images-amazon.com/images/I/91BvxWGCrSL._AC_SL1500_.jpg")
WishList.create!(user_id: 3, gift_name: "Dish Rack", amazon_url: "https://www.amazon.com/Neat-Deluxe-Chrome-plated-Steel-Drainers/dp/B00MASFZ82/ref=sxin_0_ac_d_pm?ac_md=1-0-VW5kZXIgJDIw-ac_d_pm&cv_ct_cx=dish+rack&keywords=dish+rack&pd_rd_i=B00MASFZ82&pd_rd_r=8b466c34-520f-47e5-a5cd-378912eadbf1&pd_rd_w=IXY91&pd_rd_wg=GKpxU&pf_rd_p=aba5dc0d-7593-4752-a14d-357ecc5c98cc&pf_rd_r=59XCMXWCBF2R75P65DWB&psc=1&qid=1577891303&s=musical-instruments", gift_image: "https://images-na.ssl-images-amazon.com/images/I/611IuUOCYXL._AC_SL1000_.jpg")
WishList.create!(user_id: 3, gift_name: "Pot Brush", amazon_url: "https://www.amazon.com/QTWL-Bracket-Liquid-Detergent-Bottle/dp/B07ZBYL9CL/ref=sr_1_9?keywords=dish+soap&qid=1577893669&s=musical-instruments&sr=1-9", gift_image: "https://images-na.ssl-images-amazon.com/images/I/51H7mf%2Bs1zL._AC_SL1000_.jpg")
WishList.create!(user_id: 4, gift_name: "Alexa Dot", amazon_url: "https://www.amazon.com/dp/B07FZ8S74R/ref=ods_gw_d_ha_h1_cpt_party_122919?pf_rd_p=626cbc60-0211-45bd-bbea-083ff29ec327&pf_rd_r=PBZ78KJCN940QHCW5XMW", gift_image: "https://images-na.ssl-images-amazon.com/images/I/6182S7MYC2L._AC_SL1000_.jpg")
WishList.create!(user_id: 4, gift_name: "Marbles", amazon_url: "https://www.amazon.com/Marbles-Players-Shooters-Assorted-Finishes/dp/B01CZ0IQ3K/ref=sr_1_2?keywords=marbles&qid=1577768249&s=amazon-devices&sr=1-2-catcorr", gift_image: "https://images-na.ssl-images-amazon.com/images/I/81OSKE1n6gL._AC_SL1500_.jpg")
WishList.create!(user_id: 5, gift_name: "Mini Piano", amazon_url: "https://www.amazon.com/Baby-Einstein-Wooden-Musical-Months/dp/B07R2Y1X3Z/ref=sr_1_1_sspa?keywords=baby+toy&qid=1577893856&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEySVRZS0M1UENYMkcxJmVuY3J5cHRlZElkPUEwMzM2NjEzMTBNVlAwVE9ZTUdZMSZlbmNyeXB0ZWRBZElkPUEwOTEwMjMyRkZXQldGTlZPUDlIJndpZGdldE5hbWU9c3BfYXRmJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==", gift_image: "https://images-na.ssl-images-amazon.com/images/I/71hDaiXQFFL._SL1500_.jpg")
WishList.create!(user_id: 5, gift_name: "Baby Gym", amazon_url: "https://www.amazon.com/dp/B07XNXM9HL/ref=sspa_dk_detail_3?psc=1&pd_rd_i=B07XNXM9HL&pd_rd_w=CGG45&pf_rd_p=45a72588-80f7-4414-9851-786f6c16d42b&pd_rd_wg=0MjWU&pf_rd_r=0K3XRA9D6ZK3RRMZ5WFK&pd_rd_r=de8e5c15-9ef6-47e0-85f3-10515b64a699&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyQlhSMUpMUUdSR0JHJmVuY3J5cHRlZElkPUEwMDA1MTQzM1VDM0VUSFpJUEFMMSZlbmNyeXB0ZWRBZElkPUEwNjM3ODY2R1BaWElGWlJOSlExJndpZGdldE5hbWU9c3BfZGV0YWlsJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==", gift_image: "https://images-na.ssl-images-amazon.com/images/I/611LDnQmpxL._AC_SL1000_.jpg")
puts 'create WishList - End'