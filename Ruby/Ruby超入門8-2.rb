2022.05.02

●P.189  methodsメソッド
p 1.methods.sort  ・・レシーバであるオブジェクトで呼び出せるメソッドを一覧表示できる。

●P.190  クラスの中で同じクラスのメソッドを呼び出す。
class Drink
  def name
    p self  #=> #<Drink:0x0000000155181ea0>  ・・selfはその場所でメソッド(topping)を呼び出した時のレシーバを返す。レシーバがどのオブジェクトなのかを把握できる。                                                                         
    "モカ" + topping      ・・クラスに定義されたメソッドの中で、同じクラスの他のメソッドを呼び出すときは、メソッド名をそのまま書けば良い。class Drink 〜 end 内での呼び出し。
  end　　　　　　　　　      toppingは、オブジェクト.(ドット)の省略形。省略すると、実行中のメソッド(name)のレシーバ(Drinkクラスのオブジェクト)に対してメソッドを呼び出す。
  def topping                       省略しない形は self.topping と書ける(P.192)。
    "エスプレッソショット"
  end
end

drink = Drink.new
p drink  #=> #<Drink:0x0000000155181ea0>  ・・上の p self と同じ識別番号(：以降)なので、同じオブジェクト。
p drink.name  ・・レシーバ(Drink.new = Drinkクラスのオブジェクト)を指定したメソッド呼び出し。クラス定義の外側での呼び出しではこの方法を使う。

class Drink
  def order(item)
    puts "#{item}をください"
    # name = item  ・・nameはローカル変数なので、def orderの中がスコープ。
    @name = item  ・・インスタンス変数(@name)はインスタンス(オブジェクト)が持つ変数。同じオブジェクトであれば、複数のメソッドをまたいで使うことが可能。
  end                             インスタンス変数は代入が実行されたときに生まれる。代入しなければnil。
  def reorder
    puts "#{@name}をもう1杯ください"
  end
end

drink = Drink.new  ・・このDrink.newで作られたオブジェクトが@nameの持ち主で、このオブジェクトが存在する間はインスタンス変数@nameも存在して使うことができる(P.195)。
drink.order("カフェラテ")
drink.reorder

drink1 = Drink.new
drink2 = Drink.new
p drink1  #=> <Drink:0x0000000136981188>
p drink2  #=> <Drink:0x00000001369810e8>
drink1.order("カフェラテ")  #=> カフェラテをください  ・・1つ目のオブジェクトにカフェラテを代入。
drink2.order("モカ")  #=> モカをください  ・・2つ目のオブジェクトにはモカを代入。1つ目と2つ目どちらも@nameに代入されるが、
                                                                            オブジェクトが別なのでオブジェクトごとに別の変数@nameへ代入(区別)される。
drink1.reorder  #=> カフェラテをもう1杯ください 
drink2.reorder  #=> モカをもう1杯ください  ・・reorderメソッドを実行すると、それぞれのオブジェクトの変数@nameに代入した文字列が表示され、
                                                                              オブジェクト(Drink.new)ごとに別のインスタンスとなっていることがわかる。

P.197  オブジェクト(class)の外でインスタンス変数を取得するメソッドを作る
class Drink
  def order(item)
    puts "#{item}をください"
    @name = item
  end
  def name  ・・@nameを戻り値とするメソッドを作る。メソッド名は、慣習的にインスタンス変数名から@を取り除いたもの(name)にすることが多い。
    @name          一行で定義できるattr_readerメソッドもある(P.267)。
  end
end

drink = Drink.new
drink.order("カフェラテ")  #=> カフェラテをください。
puts drink.name  #=> カフェラテ  ・・def nameを使ってオブジェクトの外でも@name カフェラテを呼び出せる。
  

# class Drink
#   def name
#     "カフェラテ"
#   end
# end
# drink = Drink.new
# p drink.methods.sort

# class Drink
#   def order(name)
#     puts "#{name}をください"
#   end
# end

# drink = Drink.new
# drink.order("モカ")

# class Drink
#   def name
#     p self
#     "モカ" + topping
#   end
#   def topping
#     "エスプレッソショット"
#   end
# end

# drink = Drink.new
# p drink
# p drink.name

class Drink
  def order(item)
    @name = item
    # puts "#{item}をください"
    # @name = item
  end
  def reorder
    puts "#{@name}をもう1杯ください"
  end
end

drink1 = Drink.new
# drink2 = Drink.new
# p drink1
# p drink2
drink1.order("カフェラテ")
# drink2.order("モカ")
drink1.reorder
# drink2.reorder

# class Drink
#   def name(text)
#     @name = text
#   end
#   def name
#     @name
#   end
# end

# drink = Drink.new
# drink.name("カフェラテ")
# puts drink.name  
  
