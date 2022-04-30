# ●P.140　mapメソッド
# result = [100, 200, 300].map do |x|
#   "#{x}円"
# end
# p result
# #=>  ["100円", "200円", "300円"]

# eachメソッドは各要素についてブロックで処理を行うことが目的となり、mapメソッドは各要素を変換した新しい配列を得ることが目的になることが多い。

# ●P.140　ブロックの省略
# 全て #=> ["cba", "321"]

# result = ["abc", "123"].map do |text|
#   text.reverse
# end
# p result

# result = ["abc", "123"].map{|text| text.reverse}
# p result

# result = ["abc", "123"].map(&:reverse)
# p result

# ●P.146　シンボル
# シンボルも文字列や整数と同じようにオブジェクトの一種。クラス名は Symbol 。
# { :coffee => 300, :coffee_latte => 400 }　・・ハッシュロケット。キーの部分はシンボル。
# { coffee: 300, coffee_latte: 400 }　・・簡易的な書き方。キーの部分はシンボル。キーがシンボル以外の時は、ハッシュロケットを使う。
# { "coffee" => 300, "coffee_latte" => 400 }　・・キーは文字列。

# ●P.147　ハッシュから値を取得
# menu = {coffee: 300, caffe_latte: 400}
# p menu[:coffee]　・・キーを「 :coffee 」と書くことに注意。値の書き方は　ハッシュ名[:キー]

# ●P.149　キーと値の組みを追加
# menu = {coffee: 300, caffe_latte: 400}
# p menu[:mocha] = 400　・・キーと値の組みを追加。menu[:mocha]に対する代入と考えると良い。既にあるキーと新しい値の組み合わせを追加すると、値が上書きされる。
# #=> 400                                     ハッシュは同じキーを複数持てない。存在しないキーを指定するとnilを返す。
# p menu
# #=> {:coffee=>300, :caffe_latte=>400, :mocha=>400}

# ●P.152　ハッシュの要素を繰り返し処理する
# menu = {"コーヒー" => 300, "カフェラテ" => 400}
# menu.each do |value, key|　・・kyeとvalueを逆にすると、コーヒーはvalueに入り、300はkeyに入る。名前は何でも良い。
#   puts "#{key}は#{value}円です"　・・kyeは300、 valueはコーヒー。
# end
# #=> 300はコーヒー円です
# #=> 400はカフェラテ円です


# ●P.154 6-2-5
# menu = {coffee: 300, caffe_latte: 400}
# p "紅茶はありませんか？" unless menu[:tea]
# または
# p "紅茶はありませんか？" if menu[:tea].nil?
# if menu[:tea] == nil　または　
#   p "紅茶はありませんか？"
# end

# menu[:tea]が存在しないとnillが返るので、nilのときに実行するunlessを使ってputs"紅茶はありませんか？"を実行させる。.nil?でもOK。
# has_kye?メソッドもOK。ハッシュにkeyがあるかどうかを調べることができる。
# menu = {coffee: 300, caffe_latte: 400}
# p "紅茶はありませんか？" unless menu.has_key?(:tea)　・・falseなのでunlessが実行される。



# ●P.154 6-2-7
# str = "caffelatte" 
# p str = str.chars.sort.group_by(&:itself)　・・charsで分割してgroup_byでハッシュにする。itsselfはself(caffelatteをハッシュにしたもの)を返す。
# 　　　　　　　　　　　　　　　　　　　　　　　キーは文字、値は使われている個数分だけ配列で表される。
# #=> {"a"=>["a", "a"], "c"=>["c"], "e"=>["e", "e"], "f"=>["f", "f"], "l"=>["l"], "t"=>["t", "t"]}
# p str.map{ |k, v| [k, v.count] }　・・countで値の数を数える。
# #=> [["a", 2], ["c", 1], ["e", 2], ["f", 2], ["l", 1], ["t", 2]]
# p str.map{ |k, v| [k, v.count] }.to_h　・・to_hはシンボルに変更。
# #=> {"a"=>2, "c"=>1, "e"=>2, "f"=>2, "l"=>1, "t"=>2}

# リファレンスより
# p (1..6).group_by {|i| i%3}
# #=> {1=>[1, 4], 2=>[2, 5], 0=>[3, 6]}
# p 1 % 3  1
# p 3 % 3  0
# p 4 % 3  1
# p 5 % 3  2
# p 6 % 3  0
# p 2 % 3  2


# puts [2, 4, 6].size

# puts [1, 2, 3].sum

# a = [2, 4, 6]
# puts a.sum / a.size

# a = [1, 1, 3]
# puts a.sum / a.size
# puts a.sum.to_f / a.size
# puts a.sum / a.size.to_f

# array1 = [1, 1, 2]
# array2 = array1.uniq
# p array1 #=> [1, 1, 2]
# p array2 #=> [1, 2]

# array1 = [1, 1, 2]
# array2 = array1.uniq!
# p array1 #=> [1, 2]
# p array2 #=> [1, 2]

# p [1, 3, 2, "2", "3"].uniq {|n| n.to_s}

# array = "コメダ珈琲店"
# p array.reverse
# p array

# order = ["カフェラテ", "チーズケーキ", "バニラアイス"].join('と')
# p order.split("と")

# result = [1, 2, 3].map do |x|
#   x * 2
# end
# p result

# result = [100, 200, 300].map do |x|
#   "#{x}円"
# end
# p result

# result = ["abc", "123"].map do |text|
#   text.reverse
# end
# p result

# result = ["abc", "123"].map{|text| text.reverse}
# p result

# result = ["abc", "123"].map(&:reverse)
# p result

# p ["abc", "123"].reverse

# p ["コーヒー", "カフェラテ"].size
# p [1, 2, 3, 4, 5].sum

# p ["モカ", "カフェラテ", "モカ"].uniq

# ary = [1, 2]
# ary.clear
# p ary

# p ["カフェラテ", "モカ", "カプチーノ"].sample
# p ["大吉", "中吉", "末吉", "凶"].sample

# p [100, 50, 300].sort.reverse
# p "cba".reverse

# p ["100", "50", "300"].join(",")
# p "100,50,300".split(",")

# p [1, 2, 3].map {|int| int * 3}
# result = [1, 2, 3].map do |int|
#  int * 3
# end
# p result

# p ["abc", "xyz"].map{ |str| str.reverse }
# ary = ["abc", "xyz"].map do |str|
#   str.reverse
# end
# p ary

# p ["aya", "achi", "Tama"].map{ |str| str.downcase }.sort

# menu = {:coffee => 300, :caffe_latte => 400}
# p menu[:caffe_latte]

# menu = {coffee: 300, caffe_latte: 400}
# menu.default = 0
# p menu[:tea]

# coffee_menu = {coffee: 300, caffe_latte: 400}
# tea_menu = {tea: 300, tea_latte: 400}
# menu = coffee_menu.merge(tea_menu)
# p menu

# menu = {coffee: 300, caffe_latte: 400}
# menu.delete(:caffe_latte)
# p menu

# menu = {"コーヒー" => 300, "カフェラテ" => 400}
# menu.each do |value, key|
#   puts "#{key}は#{value}円です"
# end

# menu = {"コーヒー" => 300, "カフェラテ" => 400}
# menu.each_key do |key|
#   puts "#{key}です"
# end

# menu = {coffee: 300, caffe_latte: 400}
# p menu[:caffe_latte]

# menu = {"モカ" => "チョコレートシロップとミルク入り", "カフェラテ" => "ミルク入り"}
# p menu["モカ"]

# menu = {coffee: 300, caffe_latte: 400}
# menu[:tea] = 300
# p menu

# menu = {coffee: 300, caffe_latte: 400}
# menu.delete(:coffee)
# p menu

# menu = {coffee: 300, caffe_latte: 400}
# p "紅茶はありませんか？" unless menu[:tea]
# if menu[:tea] == nil
#   p "紅茶はありませんか？"
# end
または
# menu = {coffee: 300, caffe_latte: 400}
# p "紅茶はありませんか？" unless menu.has_key?(:tea) 

# menu = {coffee: 300, caffe_latte: 400}
# if menu[:caffe_latte] <= 500
#   p "カフェラテください"
# end

# str = "caffelatte" 
# p str = str.chars.sort.group_by(&:itself)
# p str.map{ |k, v| [k, v.count] }.to_h

# menu = {"コーヒー" => 300, "カフェラテ" => 400}  
# menu.each do |key, value|
#   p "#{key}は#{value}円です"
# end

# menu = {"コーヒー" => 300, "カフェラテ" => 400}
# menu = menu.select {|key, value| value >= 350}
# menu.each do |key, value|
#   p "#{key}は#{value}円です"
# end

# menu = {}
# menu[:"コーヒー"] = 300
# menu[:"カフェラテ"] = 400
# menu.each do |key, value|
#   p "#{key}は#{value}円です"
# end

# menu = {"コーヒー" => 300, "カフェラテ" => 400}
# ary = []
# menu.each_key do |key|
#   ary.push(key)
# end
# p ary
