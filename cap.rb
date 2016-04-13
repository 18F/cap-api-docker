require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'pry'
require 'c2'

c2_client = C2::Client.new(
  oauth_key: ENV.fetch('OAUTH_KEY'),
  oauth_secret: ENV.fetch('OAUTH_SECRET'),
  host: ENV.fetch('C2_HOST', 'https://cap.18f.gov'),
  debug: ENV.fetch('C2_DEBUG', false)
)

resp = c2_client.post 'proposals', {
  gsa18f_procurement: {
    product_name_and_description: "some stuff",
    cost_per_unit: 123.00,
    quantity: 1,
    justification: "because because because",
    link_to_product: "18f.gov",
    purchase_type: "Software"
  }
}

proposal = resp.body
puts "new proposal has id #{proposal.id}"

resp = c2_client.get "proposals/#{proposal.id}"
puts "proposal #{proposal.id} has name #{resp.body.product_name_and_description}"
