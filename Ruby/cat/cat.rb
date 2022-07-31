def cat (filename)
  File.open(filename) do |file|
    file.each_line { |line| puts line }
  end
  p ARGV  # => ["menu.txt"]
  p filename # => "menu.txt"
rescue SystemCallError => e
  puts "--- 例外が発生しました ---"
  puts "例外クラス: #{e.class}"
  puts "例外メッセージ: #{e.message}"
end

filename = ARGV.first # 引数menu.txtを配列で渡す
cat(filename)

# filename = ARGV.last  # 試しにfirstからlastに変更して
# cat % ruby cat.rb notfound.txt menu.txt  引数を2つにする
# => p ARGV  # => ["notfound.txt", "menu.txt"]
# => p filename # => "menu.txt"
