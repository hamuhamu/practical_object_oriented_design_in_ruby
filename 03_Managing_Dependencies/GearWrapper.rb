# Gearがキーワード引数を使用できない外部モジュールのインターフェースである場合
module SomeFramework
    class Gear
        attr_reader :chainring, :cog, :wheel
        def initialize(chainring, cog, wheel)
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
end

# moduleなのでインスタンスを生成されない
# ファクトリの役割を持つ
module GearWrapper
    def self.gear(chainring:, cog:, wheel:)
        SomeFramework::Gear.new(chainring, cog, wheel)
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

# GearWrapperがSomeFramework::Gearがキーワード引数に対応していない問題を
# 解決してくれている
puts GearWrapper.gear(
    chainring:52,
    cog:11,
    wheel:Wheel.new(rim:26, tire:1.5)).gear_inches
