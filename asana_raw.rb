require 'awesome_print'
require 'pry'
require "JSON"
require "net/https"

api_key = '1vXk5ifL.3g1TWAlKnVYyfoaqRf879zU'
workspace_id = 5336764099141
assignee = "ivan@codefellows.com"

# set up HTTPS connection
uri = URI.parse(
    #"https://app.asana.com/api/1.0/workspaces/#{workspace_id}/tasks?assignee=#{assignee}")
    "https://app.asana.com/api/1.0/tasks?workspace=#{workspace_id}&assignee=me")
puts "Requesting URI: #{uri}"
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# set up the request
header = {
  "Content-Type" => "application/json"
}

req = Net::HTTP::Get.new(uri.path, header)
req.basic_auth(api_key, '')

# issue the request
res = http.start { |http| http.request(req) }

# output
body = JSON.parse(res.body)
ap body
