require "net/http"  # Net::HTTPを使えるようにする標準添付ライブラリ
require "uri"  # URIモジュールを使えるようにする標準添付ライブラリ
uri = URI.parse("https://example.com/")  # URI::HTTPSオブジェクトを作る
puts Net::HTTP.get(uri)  # Net::HTTPメソッドにURIオブジェクトを渡すことで、HTTP GETメソッドでリクエストを送っている
