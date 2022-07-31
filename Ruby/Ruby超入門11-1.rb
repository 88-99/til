# puts "金額入力"
# bill = gets.to_i
# puts "割り勘する人数を入力"
# num = gets.to_i

# begin
# warikan = bill / num
# puts "1人あたり#{warikan}円です"
# rescue ZeroDivisionError
#   puts "おっと、0人では割り勘できません"
# end

# def warikan(bill, num)  # メソッド内ではbeginとendは省略可能
#   warikan = bill / num
#   puts "1人あたり#{warikan}円です"
# rescue ZeroDivisionError
#   puts "おっと、0人では割り勘できません"
# end

# puts warikan(100, 0)
# puts warikan(100, 1)
# puts warikan(100, 2)

# bill = 100
# numbers = [0, 1, 2]
# numbers.each do |num|  # ブロック内でのbeginとendの省略
#   warikan = bill / num
#   puts "1人あたり#{warikan}円です"
# rescue ZeroDivisionError
#   puts "おっと、0人では割り勘できません"
# end 

# def warikan(bill, num)
#   if num.zero?
#     puts "おっと、0人では割り勘できません"
#     return  # 処理を終えないと結局 ZeroDivisionError になる。
#   end
#   warikan = bill / num
#   puts "1人あたり#{warikan}円です"
# end

# puts warikan(100, 0)
# puts warikan(100, 1)
# puts warikan(100, 2)


# def type(age)
#   if age < 0
#     raise "年齢がマイナスです (#{age}才"
#   elsif age < 20
#     "未成年"
#   else
#     "成年"
#   end
# end

# age = ARGV.first.to_i  # コマンドの引数をARGVで配列にして1番めの値をageに代入
# type = type(age)
# puts "#{age}才は#{type}です"

def type(age)
  if age < 0
    raise "年齢がマイナスです (#{age}才"
  elsif age < 20
    "未成年"
  else
    "成年"
  end
end
begin
  age = ARGV.first.to_i
  puts "#{age}才は#{type(age)}です"
rescue => e
  puts "例外が発生しました: #{e.message}"
ensure
  puts "ご利用ありがとうございました"
end
