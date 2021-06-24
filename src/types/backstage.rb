#class for backstages items
class Backstage
    def initialize(item)
        @item = item
    end 
    def modify_quality
        if @item.quality < 50 && @item.sell_in > 10
            @item.quality += 1 
        elsif @item.quality < 50 && @item.sell_in <= 0
            @item.quality = 0 
        elsif @item.quality < 50 && @item.sell_in <= 5
            @item.quality += 3
        elsif @item.quality < 50 && @item.sell_in <= 10
            @item.quality += 2
        end
        @item.quality = 50 if @item.quality > 50
        @item.sell_in -= 1  
    end
end