# WheelがGearに依存するパターン

class Gear
    attr_reader :chainring, :cog
    def initialize(chainring:, cog:)
        @chainring = chainring
        @cog = cog
    end

    def ratio
        chainring / cog.to_f
    end

    def gear_inches(diameter)
        ratio * diameter
    end
end

class Wheel
    attr_reader :rim, :tire, :gear
    def initialize(rim:, tire:, chainring:, cog:)
        @rim = rim
        @tire = tire
        @gear = Gear.new(chainring:chainring, cog:cog)
    end

    def diameter
        rim + (tire * 2)
    end

    def gear_inches
        gear.gear_inches(diameter)
    end

    def circumference
        diameter * Math::PI
    end
end

puts Wheel.new(rim:26, tire:1.5, chainring:52, cog:11).gear_inches
