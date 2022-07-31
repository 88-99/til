require "net/http"
require "uri"
require "json"
# uri = URI.parse("https://igarashikuniaki.net/example.json")
# result = Net::HTTP.get(uri)
# hash = JSON.parse(result)
# p hash
# p hash["caffe latte"]

# p({mocha: 400}.to_json)

uri = URI.parse("https://www.example.com")
result = Net::HTTP.post(uri, {mocha: 400}.to_json, "Content-Type" => "application/json")
p result
