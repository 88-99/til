2022.05.01

●P.163, 166コラム
def area(x, y)  ・・引数はメソッドへオブジェクトを渡す機能。
  x * y  ・・戻り値はメソッドから呼び出し元へオブジェクトを返す機能。
end         引数の個数はメソッドの定義側と呼び出し元で同数にする。

result = area(6, 5)  ・・呼び出し元(変数に代入している)
p result

()の省略
def area x, y  ・・()は省略可能だが、定義の()はあまり省略されない。引数が0のときだけは省略されることも多い。
  x * y
end

result = area 7, 5  ・・()は省略可能。呼び出しの()は省略されることは多い。引数がないメソッドの呼び出しにも()を付けることができる。area()。
p result

あいまいではない範囲でメソッドの()は省略できる。「あいまいではない = 別の解釈ができない」ということ。
あいまいなときはエラーが出るので、()を書いて試す。

●P.165  return
def thanks_and_receipt(receipt)
  puts "ありがとうございました"
  unless receipt  ・・引数を受け取る。falseで実行される。
    return  ・・処理が終わり呼び出し元へ戻る。returnより後の行は実行されない。
  end
  puts "レシートをどうぞ"
end

thanks_and_receipt(true)  ・・引数を渡す。true or false。

def dice  ・・P.176  7-3-5
  num = [1, 2, 3, 4, 5, 6].sample
  return num unless num == 1
  puts "もう一回"
  num = [1, 2, 3, 4, 5, 6].sample
end
puts dice  ・・戻り値 return num。num == 1の時だけreturnは実行されず、puts "もう一回"以下が実行される。

〔別解〕
def dice_core
  [1, 2, 3, 4, 5, 6].sample
end

def dice
  num = dice_core
  return num unless num == 1
    puts "もう1回"
    dice_core
end
puts dice

●P.169　デフォルト値、キーワード引数
def order(item = "コーヒー", size = "S")  ・・引数なしで、デフォルト値を設定できる。内側の処理にハッシュなどを使う場合、イコール(=)を使うとエラー。シンボルを使う。
def order(item: "コーヒー", size: "S") ・・引数なしで、デフォルト値を設定できる。シンボルを使うパターン。
def order(item:, size:)  ・・キーワード引数はシンボルを使う
  "#{item}を#{size}サイズでください"
end
puts order  ・・引数なし
puts order(item: "カフェラテ", size: "ベンティ")  ・・キーワード引数
puts order(size: "ベンティ", item: "カフェラテ")  ・・順番を変えてもOK。
puts order(size: "ベンティ")  ・・複数のうち一つの指定でもOK。#=> コーヒーをベンティサイズでください

●P.174　スコープ
def hello
  text = "こんにちは"
  p text
end

hello
p text  ・・メソッド内で定義した変数(text)はメソッドの外からは見えないため、helloメソッド外では使えない。逆の、メソットの外で定義された変数もメソッドの中では使えない。
                  helloメソッドの実行が終わると、メソッド内の変数テキストとそれが指す文字列オブジェクト"こんにちは"は、役目を終えて破棄される。

スコープ：変数の見える範囲と寿命のこと。上記に出てきた変数をローカル変数と言い、スコープの中で最も狭いスコープである。

P.178  クラス  インスタンス
クラス：「オブジェクトの種族を表すもの」。すべてのオブジェクトはいずれかのクラスに属している。classメソッドでどのクラスに属するかを調べることができる。
いろいろなオブジェクトが、どのクラスに属するかを調べてみよう。
リファレンスマニュアルはクラスごとに別れている。クラスのわからないオブジェクトの持つメソッドを調べたいとき、classメソッドでクラスを調べれば、
リファレンスマニュアルで、そのクラスの中からメソッドを探すことができる。

インスタンス：クラスに属するオブジェクトをそのクラスの「インスタンス」であるとも言う。インスタンスはオブジェクトとほぼ同じ意味で使うが、
「クラスから作ったオブジェクトである」「そのクラスに属する」ことを強調したいときに用いる。

P.180  オブジェクトを作る方法

〔作る方法①〕
p "カフェラテ"  ・・Stringオブジェクト
p [1, 2, 3]  ・・Arrayオブジェクト

〔作る方法②〕（Integerクラスのようにnewメソッドが用意されていないものもある。）
クラス.new  #=> そのクラスのオブジェクト
p String.new  #=> ""  ・・空であるStringクラスのオブジェクト(空文字列)を作る。
p Array.new  #=> []  ・・空であるArrayクラスのオブジェクト(空配列)を作る。
p Array.new(3, 4)  #=> [4, 4, 4]
p Array.new(2, "コーヒー")  #=> ["コーヒー", "コーヒー"]

P.182  クラスを作る
クラスを作ることを「クラスを定義する」と言う。
クラスの定義：class クラス名(クラス名の頭文字は大文字)
2単語以上を組み合わせるときはキャメルケース(区切り文字が大文字)を使う。CaffeLatte。大文字がラクダ(camel)に見えるからキャメルケース。

class Drink  ・・Drinkクラスを定義する。
   def name  ・・間に書くことで、nameメソッドはDrinkクラスのメソッドとして定義される(P.187)。メソッドは(呼び出されると)最後に実行した結果を返す。
    "カフェラテ"
  end
end
drink = Drink.new  ・・Drinkクラスのオブジェクトを作り、drinkに代入。
puts drink.name  #=> "カフェラテ"                    ・・Drinkクラスのオブジェクトを使ってnameメソッドを呼び出す(オブジェクト.メソッド)。(P.187)
puts Drink.new.name  #=> "カフェラテ"                   クラス(Drink)に定義したメソッド(name)はそのクラスに属するすべてのオブジェクト(この場合はdrinkに代入された
p drink.class  #=> Drink                                             Drinkクラスのオブジェクト(レシーバと言う(P.188)))で呼び出せる。

〔まとめ〕このプログラムは、Drinkクラスにnemeメソッド(def name 〜 end)を定義することにより、Drinkクラスのオブジェクト(Drink.newで作成)でnameメソッドを実行すれば、
"カフェラテ"を表示できるというもの(P.188)。

newメソッドを使うことでそのクラスのオブジェクトを作ることができる。クラスはその種類のオブジェクトを作ることができる工場のようなもの。
そのクラス自身が仕事をすることもあれば、そのクラスから作ったオブジェクトが仕事をする場合もある。

定数の頭文字は大文字。クラス名も定数。Drinkクラスを定義すると、Drinkという定数が作られる。

class Drink  ・・クラス(Drink)そのものもオブジェクト。
end

Drink.class  #=> Class  ・・クラスはClassクラスのオブジェクト。

# def thanks_and_receipt(receipt)
#   greeting = "ありがとうございました。"
#   unless receipt
#     return puts greeting
#   end
#   puts greeting + "レシートをどうぞ。"
# end

# thanks_and_receipt(false)

# def order(item = "カフェラテ")
#   "#{item}をください"
# end

# puts order

# def area(x)
#   x * x
# end

# puts area(3)

# def dice
#   [1, 2, 3, 4, 5, 6].sample
# end

# puts dice

# def order(item)
#   "#{item}をください"
# end

# puts order("カフェラテ")
# puts order("モカ")

# def dice_core
#   [1, 2, 3, 4, 5, 6].sample
# end

# def dice
#   num = dice_core
#   return num unless num == 1
#     puts "もう1回"
#     dice_core
# end
# puts dice

# def dice
#   num = [1, 2, 3, 4, 5, 6].sample
#   if num == 1
#     p "もう1回"
#     [1, 2, 3, 4, 5, 6].sample
#     p num
#   else
#     p num
#   end
# end
# dice

# def price(item)
#   items = {"コーヒー" => 300, "カフェラテ" => 400}
#   items[item]
# end
# puts price("カフェラテ")

# def price(item:)
#   if item == "コーヒー"
#     puts 300
#   elsif item == "カフェラテ"
#     puts 400
#   end
# end
# def price(item:)
#   case item
#   when "コーヒー"
#     300
#   when "カフェラテ"
#     400
#   end
# end
# price(item: "コーヒー")

# def price(item:, size: "ショート")
#   items = {"コーヒー" => 300, "カフェラテ" => 400}
#   sizes = {"ショート" => 0, "トール" => 50, "ベンティ" => 100}
#   items[item] + sizes[size]
# end
# puts price(item: "カフェラテ", size:"トール")

# def price(item:, size: "ショート")
#   total = case item
#     when "コーヒー"
#       300
#     when "カフェラテ"
#       400
#     end
#     # total + case size
#     total += case size
#     when "ショート"
#       0
#     when "トール"
#       50
#     when "ベンティ"
#       100
#     end
# end
# puts price(item: "カフェラテ", size: "ベンティ")

# def order(drink)
#   puts "#{drink}をください"
# end

# order("コーヒー")

# p Array.new(2, "コーヒー")

class Drink
  def name
    "カフェラテ"
  end
end

p Drink.new.name
# drink = Drink.new
# p drink.name
# p drink.class
