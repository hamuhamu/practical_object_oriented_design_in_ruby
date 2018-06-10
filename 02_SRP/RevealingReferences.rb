class RevealingReferences
    attr_reader :wheels
    def initialize(data)
        @wheels = wheelify(data)
    end

    def diameters
        wheels.collect{|wheel| diameter(wheel)}
    end

    def diameter(wheel)
        wheel.rim + (wheel.tire * 2)
    end

    Wheel = Struct.new(:rim, :tire)
    def wheelify(data)
        data.collect{|cell|
            Wheel.new(cell[0], cell[1])}
    end
end

puts RevealingReferences.new([[622, 20], [622, 23], [559, 30], [559, 40]]).diameters

# @dataは複雑なデータ構造である
# クラスの利用者が0番目がリムで1番目がタイヤであることを知らなければならない
#
# diametersメソッドは配列の構造に依存している
# 配列の構造が変わると、コードを変更しなければいけない
