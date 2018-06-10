class ObscuringReferences
    attr_reader :data
    def initialize(data)
        @data = data
    end

    def diameters
        # 0はリム, 1はタイヤ
        data.collect{|cell|
            cell[0] + (cell[1] * 2)}
    end
end

puts ObscuringReferences.new([[622, 20], [622, 23], [559, 30], [559, 40]]).diameters

# @dataは複雑なデータ構造である
# クラスの利用者が0番目がリムで1番目がタイヤであることを知らなければならない
#
# diametersメソッドは配列の構造に依存している
# 配列の構造が変わると、コードを変更しなければいけない
