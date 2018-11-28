Bid.delete_all
Auction.delete_all
User.delete_all

PASSWORD = "supersecret"

sample_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  username: 'Knower of Nothing',
  email: "js@winterfell.gov",
  password: PASSWORD
)

sample_auction = Auction.create(
  title: 'Sample Item',
  details: 'Sample Details',
  ends_on: Time.now,
  reserve_price: 100,
  user: sample_user
)

sample_auction.bids << Bid.new(
  price: 110,
  user: sample_user
)

p "Created #{User.count} user, #{Auction.count} auction, and #{Bid.count} bid. Sample user info: js@winterfell.gov, supersecret"