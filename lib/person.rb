require './lib/craft'

class Person

  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = {}
  end

  def add_supply(supply_name, count)
    @supplies[supply_name] ||= 0
    @supplies[supply_name] += count
  end

  def can_build?(craft)
    craft.supplies_required.all? do |supply, count|
      @supplies.keys.include?(supply) && @supplies[supply] >= count
    end
  end

end
