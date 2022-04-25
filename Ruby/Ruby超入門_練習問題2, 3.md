puts 2 + 3

puts 2 * 2 * 3.14

puts "ruby"

puts "abc" + "def"

str = "123" + "456"
puts str.to_i

coffee = 300
espresso = 100
total = coffee + espresso * 2
puts "コーヒー:#{coffee}円"
puts "合計:#{total}円"

coffee = 300
coffee += 100
espresso = 100
total = coffee + espresso * 2
puts "コーヒー:#{coffee}円"
puts "合計:#{total}円"

total = 300 * 2
puts total
tax = total * 0.08
puts tax

total = 300 * 2
puts total


a = 2
puts a < 365

a = 2
puts a == 1 + 1

season = "春"
if season != "夏"
  puts "あんまんたべたい"
end

season = "夏"
if season == "夏"
  puts "かき氷たべたい"
  puts "麦茶のみたい"
end

wallet = 100
if wallet >= 120
  puts "ジュース買おう"
else
  puts "お金じゃ買えない幸せがたくさんあるんだ"
end

x = 200
if x <= 0 || x >= 100
  puts "範囲外です"
end

x = 0
y = -1
z = 1
if x > 0 || y > 0 || z > 0
  puts "正の数です"
end

season = "冬"
case
when season == "春"
  puts "アイスを買っていこう！"
when season == "夏"
  puts "かき氷を買っていこう！"
else
  puts "あんまん買ってこう！"
end

2.times do
  puts "カフェラテ"
  2.times do
    puts "モカ"
  end
end
puts "フラペチーノ"
