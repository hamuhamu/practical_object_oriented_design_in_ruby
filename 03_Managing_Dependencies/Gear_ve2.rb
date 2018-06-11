class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring:, cog:, wheel:)
        @chainring = chainring
        @cog = cog
        @wheel = wheel
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        ratio * diameter
    end

    # ラッパーメソッドを作ることでWheelのdiameterのメソッドシグネチャに
    # 変更があっても影響範囲をこのラッパーメソッド内に収めることができる
    def diameter
        wheel.diameter
    end
end

class Wheel
    attr_reader :rim, :tire
    def initialize(rim:, tire:)
        @rim = rim
        @tire = tire
    end

    def diameter
        rim + (tire * 2)
    end

    def circumference
        diameter * Math::PI
    end
end

# Gearクラスはinitializeの引数の順番を知っている必要がある
# puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches

# キーワード引数を使うことで、引数の順番を知らなくて良い
# 引数の順番に対する依存が取り除かれる
puts Gear.new(chainring:52, cog:11, wheel:Wheel.new(rim:26, tire:1.5)).ratio
