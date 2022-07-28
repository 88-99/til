class Blurb
  attr_accessor :content, :time, :mood    # クラスBlurbの外からでも指定のインスタンス変数にアクセスできるようにするメソッド。

  def initialize(mood, content="")    # ①で起動。
    @time    = Time.now
    @content = content[0..39]
    @mood    = mood
  end

  def moodify
    if    @mood == :sad
      return ":-(s"    # 気分がsadならreturnを返す
    elsif @mood == :happy
      return ":-)h"
    # Add other moods here
    end

    # The default mood
    ":-|"   # 上記以外の場合のデフォルト
  end
end

class Blurbalizer
  def initialize(title)
    @title  = title
    @blurbs = []    # 空の配列を定義
  end

  def add_a_blurb(mood, content)
    @blurbs << Blurb.new(mood, content)   # Blurbクラスのオブジェクトを作成して、引数mood, contentを配列の最後に追加。上のinitialize(title)が起動する。・・①
  end

  def show_timeline
    puts "Blurbalizer: #{@title} has #{@blurbs.count} Blurbs #{Blurb2.moodify}"   # Blurbs #{Blurb2.moodify}を追記

    @blurbs.sort_by { |t|   # 昇順に並び替え
      t.time
    }.reverse.each { |t|    # 逆順に並び替え(降順)
      puts "#{t.content.ljust(40)} #{t.time}"   # 40文字分の幅で左寄せしたcontentと時間を表示。
    }
  end
end

Blurb2 = Blurb.new :happy # , "I can not believe Mt. Hood was stolen!"   # Blurbクラスのinitialize(mood, content="")に引数が代入される。
myapp = Blurbalizer.new "The Big Blurb"   # "The Big Blurb"を引数(title)としてinitialize(title)に渡す。
myapp.add_a_blurb :sad, "aaaaaa"
myapp.show_timeline
