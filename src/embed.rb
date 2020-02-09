require 'ffi'

# FFI::Libraryモジュールを拡張し、ffi_libを呼び出す
  module Hello
  extend FFI::Library
  # リリースビルドで生成したライブラリからffi_libを呼び出す
  ffi_lib 'target/release/libembed.dylib'
  # Rustのprocess()を同じ名前のRuby関数に接続する
  attach_function :process, [], :void
end

# 実際のRustの呼び出し
Hello.process

puts 'done!'
