#class for conjured items
class Conjured
    def initialize(item)
        @item = item
    end
    def modify_quality
        if @item.quality > 0 && @item.sell_in > 0
            @item.quality -= 2
        elsif @item.quality > 0 && @item.sell_in <= 0
            @item.quality -= 4
        end
        @item.quality = 0 if @item.quality < 0
        @item.sell_in -= 1
    end
end