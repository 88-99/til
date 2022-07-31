require "sinatra"
# get "/hi" do
#   "hi!"

get "/drink" do
  ["カフェラテ", "モカ", "コーヒー"].sample
end
