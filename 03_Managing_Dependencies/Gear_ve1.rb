#  このGearクラスは不要な依存関係を持っています
class Gear
    attr_reader :chainring, :cog, :rim, :tire
    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog = cog
        @rim = rim
        @tire = tire
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches
        # GearはWheelという名前のクラスが存在することを知っている
        # GearはWheelがdiameterを持っていることを知っている
        # GearはWheel.newにrimtとtireが必要なことを知っている
        # GearはWheel.newの引数の順番を知っている
        #
        # Wheelのクラス名やメソッド名、引数が変わればGearは影響を受ける
        # GearはWheelクラスのことを知らなくて良い
        ratio * Wheel.new(rim, tire).diameter
    end
end

class Wheel
    attr_reader :rim, :tire
    def initialize(rim, tire)
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

puts Gear.new(52, 11, 26, 1.5).gear_inches
