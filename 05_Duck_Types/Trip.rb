class Trip
    attr_reader :bicycles, :customers, :vehicle

    def prepare(prepares)
        prepares.each {|prepare|
        prepare.prepare_trip(self)}
    end
end

# 準備が必要なクラスはprepare_tripに対応するダック
class Mechanic
    # ダックタイピング
    def prepare_trip(trip)
        trip.bicycles.each{|bicycle|
            prepare_bicycle(bicycle)}
    end

    def prepare_bicycle(bicycle)
        # ・・・
    end
end

class TripCordinator
    # ダックタイピング
    def prepare_trip(trip)
        buy_food(trip.customers)
    end

    def buy_food(customers)
        # ・・・
    end
end

class Driver
    # ダックタイピング
    def prepare_trip(trip)
        vehicle = trip.vehicle
        gas_up(vehicle)
        fill_water_tank(vehicle)
    end

    def gas_up(vehicle)
        # ・・・
    end

    def fill_water_tank(vehicle)
        # ・・・
    end
end
