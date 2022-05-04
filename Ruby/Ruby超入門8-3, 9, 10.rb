2022.05.03

●P.198  インスタンス変数へ代入するメソッド
class Drink
  def name=(text)  ・・慣習的に「インスタンス変数名から＠を取り、末尾に=を加えたもの」にすることが多い。
    @name = text
  end
  def name
    @name
  end
end

drink = Drink.new
drink.name=("カフェラテ")  ・・メソッド名は「name=」
drink.name = "カフェオレ"  ・・慣習に従えば、末尾が=で終わるメソッドはこのように書ける。
puts drink.name                         インスタンス変数へ代入することが感覚的にわかりやすい。=をなくすと、下のdef nameと重複するのでエラー。

p drink.instance_variables  #=> [:@name]  ・・オブジェクトが持っている全てのインスタンス変数の変数名を一覧で返す。＠変数は代入しないと出てこない。

●P.200
class Drink
  def initialize  ・・他のメソッドと同じ手順で定義。
    puts "新しいオブジェクト!"
  end
end
Drink.new  #=> 新しいオブジェクト!  ・・newメソッドを呼び出しオブジェクトを作成するときに、initializeメソッドが自動で呼ばれる。

〔initializeメソッドを使う場合〕
class Drink
  def initialize
    @name = "カフェラテ"  ・・「インスタンス変数の初期値を設定する」場合に便利。初期値としてカフェラテを設定。
  end                                            Drinkクラスのオブジェクトを作る時に、＠nameに自動で"カフェラテ"が代入される。
  def name
    @name
  end
end
drink = Drink.new  ・・initializeメソッドが呼ばれ、自動でカフェラテが代入。
puts drink.name  #=> カフェラテ  ・・初期値としてカフェラテが表示される。

「initialize」メソッドを使うことでオブジェクトを作成時に必ず実行したい処理をメソッドを呼び出すことなく実行することができる。
https://www.javadrive.jp/ruby/class/index5.html

〔initializeメソッドを使わない場合〕
class Drink
  def name=(item)
    @name = item
  end
  def name
    @name
  end
end
drink = Drink.new
puts drink.name = "カフェラテ"

〔引数を渡す場合〕P.202
class Drink
  def initialize(item)
    @name = item
  end
  def name
    @name
  end
end
drink = Drink.new("カフェラテ")  ・・この行で引数を設定する
puts drink.name  #=> カフェラテ

●P.203  インスタンスメソッドとクラスメソッド
インスタンスメソッド：レシーバ( . の前に書かれたメソッドを呼び出すオブジェクト)がインスタンス(あるクラスのオブジェクト)であるメソッド。
クラスメソッド：レシーバがクラスであるメソッド。例：newメソッド。Drink.newであれば、クラス名に続いて呼び出す。

●P.204  クラスメソッド
class Cafe
  def self.welcome  ・・クラスメソッドを定義。メソッドの前にselfを付ける。
    "いらっしゃいませ！"
  end
end
puts Cafe.welcome  #=> いらっしゃいませ！  ・・クラスメソッドの呼び出し。newする必要がない。


class Cafe
  class << self  ・・これを書いてからメソッドを定義すると複数のクラスメソッドをまとめて書くのに便利(P.206)。
    def welcome  ・・class << self を書けばself.がいらない。
    def self.welcome  ・・クラスメソッドの定義。メソッド名の前にselfを付ける。
      "いらっしゃいませ！"
    end
    def welcome_again  ・・class << self を書けばself.がいらない。
    def self.welcome_again  ・・クラスメソッドの中で同じクラスのクラスメソッドを呼ぶ場合(P.205)。
      welcome + "いつもありがとうございます！"  ・・インスタンスメソッドと同じでメソッド名だけを書く。
    end
  end
end
puts Cafe.welcome_again  ・・クラス名Cafeに続いて . メソッド名で呼び出す。クラスが実行するので、オブジェクトを作ることなく呼び出すことができる。
#=> いらっしゃいませ！いつもありがとうございます！

●P.206  インスタンスメソッドからクラスメソッドを呼ぶことができる。
self.class.クラスメソッド名
クラス名.クラスメソッド名

〔Hogeクラスの場合〕
class Hoge
  def self.AAA
  end
  def BBB
  end
end

インスタンスメソッドBBBからクラスメソッドAAAを呼び出す。
def BBB
 Hoge.AAA
 self.class.AAA
end

クラスメソッドからインスタンスメソッドを呼ぶことはできない。クラスからは、レシーバとなるインスタンスを決めることができないため。

●P207  継承を使ってクラスを分ける。
class AAA
  def bbb
  end
end

class BBB < AAA  ・・継承。このようにクラスを定義すると、AAAクラスを継承したBBBクラスが作れる。BBBクラスはAAAクラスのすべてのメソッドを受け継ぐ。
                                     「AAAクラスを継承してBBBクラスを定義する」「BBBクラスはAAAクラスを継承したクラス」と言う。子クラスで親クラスのメソッドを使用可能。
  # def ccc  ・・class AAAと同一なので継承して書かない。
  # end               
  def ddd
  end
end

AAAクラス：スーパークラスと言う。親クラス。
BBBクラス：サブクラスと言う。子クラス。

〔メソッドはどちらに書く？〕
親クラス：Item
子クラス：Drink

価格設定・取得するメソッドは商品全般に共通するもの→親であるItemクラスに書く。
ホットかアイスかを設定・取得するメソッドはドリンクに固有のもの→子であるDrinkクラスに書く。
Item(親)クラスに書かれたものは、別のクラス(Foodクラスなど)を作る時にも共通利用できる(P.209)。

●P.210  あるクラスの継承関係を見るメソッド：ancestorsメソッド。継承関係上の先祖を辿ることができる。

●P.211  親と子で同名のクラスがある場合、自分のクラスのメソッドが呼ばれる。継承関係を親へ親へ辿って行き、最初に該当したメソッドを呼び出す。
親クラスの同名メソッドは呼ばれず、覆い隠された状態になる。子の親と同名のメソッドの中にsuperを書くと親メソッドを呼び出せる(P.212)。

class 子 < 親
  def full_name  ・・親クラスと同名のメソッド
    super
  end
end

●P.213 メソッド呼び出しの制限。private。
makanaiはstaff用なので、呼び出しを制限する。
class Cafe
  def staff
    makanai  ・・makanaiメソッドを呼び出す。privateなメソッドを定義すると、このようにレシーバを書かない形式でのみ呼び出せるので,
                            結果的にメソッドを呼び出すことができる場所をクラス定義の中だけに限定できる。
  end
  private
  def makanai
    "店員用スペシャルメニュー"
  end
end

cafe = Cafe.new
puts cafe.staff  ・・staffメソッドを使いmakanaiメソッドを呼び出すことが可能。このようにレシーバに続けて書いて呼び出せるメソッドをpublicメソッドと言う。
                                  クラス定義の外でも書くことができる。
puts cafe.makanai   #=> エラー ・・privateの下にあるのでmakanaiメソッドを呼び出すことはできない。

makanaiメソッドをprivateにすることで、「このクラスのオブジェクトでは、makaniメソッドを使うのではなく、staffメソッドを使ってくださいね」という設計上の意図を
ほかのプログラマーへ伝えることができている。プログラムを通じて、作ったクラスとメソッドをそのオブジェクトらしく正しく使ってもらう方法を伝える大切な機能。

privateとpublicは何度でも書けるが、最初にpublicをまとめて書き、そのあとにprivateを書くことが一般的。そのクラスの使い方を知る時にはpublicなメソッドを
読む必要があるので、先頭に書いてあった方が都合が良い。(細かな書き方はP.217)

●P.222  モジュール：複数のクラスでメソッドを共同利用。

module WhippedCream  ・・クラス名と同じようにキャメルケースで定義する。
  def whipped_cream  ・・①
    @name += "ホイップクリーム"  ・・②
  end
end

class Drink
  include WhippedCream  ・・1つのクラスの中でincludeメソッドは何度でも呼ぶことができるので、複数のモジュールを同じクラスでincludeして共同利用することも可能。
    def initialize(name)              継承では親子関係がないと違和感を感じることが多いが、モジュールはそれを気する必要がない。
      @name = name
    end
    def name
      @name
    end
  end
  drink = Drink.new("モカ")
  drink.whipped_cream  ・・drinkオブジェクトのwhipped_creamメソッドが呼びだされ(①)、@nameの末尾に"ホイップクリーム"が足される(②)。
  puts drink.name  #=> モカホイップクリーム

●P.226  Enumeratorモジュール
Rubyリファレンス
「Array, Hash, Range, Enumerator等のクラスで、 Enumerableモジュールはインクルードされています。」

EnumeratorモジュールはArray(配列)クラスにincludeされている。→ 配列ではEnumeratorモジュールのメソッドもすべて使えるということ。
Enumeratorモジュールには、eachメソッドを使うメソッド群が定義されているので、Enumeratorモジュールを使うためには、include元のクラスにeachメソッドが
定義されている必要がある。→ これは逆に言うと、自分で作ったクラスにeachメソッドを定義しておけば、Enumeratorモジュールをincludeすることで、
Enumeratorモジュールのたくさんのメソッド群を使うことができるという便利な仕組み。

●P.236
Rubyには大きく分けて3つのライブラリがある。
・組み込みライブラリ・・Integer, String, Array, Hashと言ったクラスたち。
・標準添付ライブラリ・・requireメソッドを実行して準備する。JSONなどのクラス。
・Gem・・使う前にインストールが必要。

Bundler：使うGemの数だけインストールしなくてはならないので、複数のGemを簡単に管理できる仕組み。
Gemfile：bundle initで雛形を作成し、使いたいファイルを追記する。
    
# class Drink
#   def order(item)
#     @name = item
#     puts "#{item}をください"
#     # @name = item
#   end
#   def reorder
#     puts "#{@name}をもう1杯ください"
#   end
# end

# drink = Drink.new
# drink.order("カフェラテ")
# drink.reorder
# p drink.instance_variables

# class Drink
#   def name=(text)
#     @name = text
#   end
#   def name
#     @name
#   end
# end

# drink = Drink.new
# # drink.name=("カフェラテ")
# drink.name="カフェオレ"
# puts drink.name
# p drink.instance_variables

# class Drink
#   def name=(item)
#     @name = item
#   end
#   def name
#     @name
#   end
# end
# drink = Drink.new
# puts drink.name = "カフェラテ"

# class Drink
#   def initialize(name)
#     @name = name
#   end
#   def name
#     @name
#   end
# end
# drink = Drink.new("モカ")
# puts drink.name

# class Drink
#   def initialize(name)
#     @name = name
#   end
#   def name
#     @name
#   end
# end

# drink1 = Drink.new("カフェラテ")
# drink2 = Drink.new("コーヒー")
# drink3 = Drink.new("モカ")

# puts drink1.name
# puts drink2.name
# puts drink3.name


# class Item
#   def name
#     @name
#   end
#   def name=(text)
#     @name = text
#   end
# end

# class Drink < Item
#   # def name
#   #   @name
#   # end
#   # def name=(text)
#   #   @name = text
#   # end
#   def size
#     @size
#   end
#   def size=(text)
#     @size = text
#   end
# end

# item = Item.new
# p item.name = "マフィン"

# drink = Drink.new
# drink.name = "カフェオレ"
# drink.size = "tall"
# puts "#{drink.name}" "#{drink.size}サイズ"

# class Item
#   def name
#     @name
#   end
#   def name=(text)
#     @name = text
#   end
#   def full_name
#     @name
#   end
# end

# class Drink < Item
#   def size
#     @size
#   end
#   def size=(text)
#     @size = text
#   end
#   def full_name
#     super
#     # "#{@name} #{@size}サイズ"
#   end
# end

# drink = Drink.new
# drink.name = "カフェオレ"
# drink.size = "tall"
# puts drink.full_name

# class Foo
#   private
#   # def self.a
#   private_class_method def self.a  
#     "method a"
#   end
# end
# p Foo.aqwe

# p ({:coffee => 300, :caffe_latte => 400}).class
# h = {:coffee => 300, :caffe_latte => 400}
# p h.class

# p Hash.new

# p hash.h
# class Hash
#   def h
#    {}
#   end
# end
# hash = Hash.new

# class CaffeLatte
# end
# p CaffeLatte.new.class

# class Item
#   def name(item)
#     p item
#   end
# end
# item = Item.new
# item.name("チーズケーキ")

# class Item
#   def name=(item)
#     @name = item
#   end
#   def name
#     @name
#   end
# end
# item = Item.new
# p item.name = "チーズケーキ"

# class Item
#   def initialize
#     puts "商品を扱うオブジェクト"
#   end
# end
# Item.new

# class Item
#   def initialize(item)
#     @name = item
#   end
#   def name
#     @name
#   end
# end
# item1 = Item.new("マフィン")
# item2 = Item.new("スコーン")
# p item1.name
# p item2.name

# class Drink
#   def self.todays_special
#     "ホワイトモカ"
#   end
# end
# p Drink.todays_special

# class Item
#   def name
#     @name
#   end
#   def name=(item)
#     @name = item
#   end
# end

# class Food < Item
# end
# food = Food.new
# puts food.name = "チーズケーキ"

# module WhippedCream
#   def whipped_cream
#     @name += "ホイップクリーム"
#   end
# end

# class Drink
#   include WhippedCream
#     def initialize(name)
#       @name = name
#     end
#     def name
#       @name
#     end
#   end
#   drink = Drink.new("モカ")
#   drink.whipped_cream
#   puts drink.name

# module WhippedCream
#   def whipped_cream
#     @name += "ホイップクリーム"
#   end
# end

# class Drink
#   include WhippedCream
#     def initialize(name)
#       @name = name
#     end
#     def name
#       @name
#     end
#   end

# class Cake
#   include WhippedCream
#   def initialize(name)
#     @name = name
#   end
#   def name
#     @name
#   end
# end

#   drink = Drink.new("モカ")
#   drink.whipped_cream
#   puts drink.name

#   cake = Cake.new("チョコレートケーキ")
#   cake.whipped_cream
#   puts cake.name

# module Greeting
#   def wlcome
#     "いらっしゃいませ"
#   end
# end
# class Cafe
#   extend Greeting
# end
# puts Cafe.welcome

# module WhippedCream
#   def self.info
#     "トッピング用ホイップクリーム"
#   end
# end
# puts WhippedCream.info

# module WhippedCream
#   Price = 100
# end
# puts WhippedCream::Price

# module BecoCafe
#   class Coffee
#     def self.info
#       "深みと香りのコーヒー"
#     end
#   end
# end
# module MachuCafe
#   class Coffee
#     def self.info
#       "豊かな甘みのコーヒー"
#     end
#   end
# end
# puts BecoCafe::Coffee.info
# puts MachuCafe::Coffee.info

# module ChocolateChip
#   def chocolate_chip
#     @name += "チョコレートチップ"
#   end
# end

# class Drink
#   include ChocolateChip
#   def initialize(name)
#     @name = name
#   end
#   def name
#     @name
#   end
# end

# drink = Drink.new("モカ")
# drink.chocolate_chip
# puts drink.name

# module EspressoShot
#   Price = 100
# end

# p EspressoShot::Price

# module WhippedCream
#   def self.info
#     "トッピング用ホイップクリーム"
#   end
# end
# require_relative "test2"
# puts WhippedCream.info
