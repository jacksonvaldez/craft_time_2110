require './lib/craft'

class Person

  attr_reader :name, :interests, :supplies

  def initialize(data)
    @name = data[:name]
    @interests = data[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(supply_name, count)
    @supplies[supply_name] += count
  end

  def can_build?(craft)
    craft.supplies_required.all? do |supply, count|
      @supplies[supply] >= count
    end
  end

end
