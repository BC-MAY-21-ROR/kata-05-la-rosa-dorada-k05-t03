require_relative "types/random"
require_relative "types/aged"
require_relative "types/backstage"
require_relative "types/conjured"
require_relative "types/sulfuras"

#class to run rules for gilded rose
class GildedRose
  attr_reader :clasi

  def initialize(items)
    @items = items
    @clasi =  'Random'
  end

  def update_quality()
    names = ['Aged Brie','Sulfuras, Hand of Ragnaros','Backstage passes to a TAFKAL80ETC concert','Conjured Mana Cake']
    @items.each do |item|
      @clasi = (names.include? item.name) ? item.name.split.first : 'Random'
      @clasi = 'Sulfuras' if @clasi == 'Sulfuras,'
      res = Object.const_get(@clasi).new(item)
      res.modify_quality
    end  
  end
end

#class to make items
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

