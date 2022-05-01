2022.04.27

# drinks = ["コーヒー", "カフェラテ"]
#   p drinks

# drinks = ["コーヒー", "カフェラテ", "モカ"]
#   p drinks[1]
#   p drinks[0]
#   p drinks[2]
#   p drinks [0][2] #=> "ヒ" ・・drinks[0]である"コーヒー"の中の 0 1 [2]番目の"ヒ"が返る。

# drinks = ["コーヒー", "カフェラテ"]
# p drinks.push("モカ")

# p [2, 3].unshift(1)

# p [1, 2] + [3, 4]

# drinks = ["ティーラテ", "カフェラテ", "抹茶ラテ"]
# drinks.each do |drink|
#   p "#{drink}お願いします"
# end

# sum = 0
# [1, 2, 3].each do |x|
#   sum = sum + x
# end
# p sum

# drinks = ["ティーラテ", "カフェラテ", "抹茶ラテ"]
# 3.times do
#   drinks.pop
# end
# p drinks
# ↓ 
drinks = []
drinks.each do |drink|
  p drink
end
p drinks
