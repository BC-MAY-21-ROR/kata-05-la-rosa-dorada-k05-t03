require File.join(File.dirname(__FILE__), '../src/gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
    it "quality is never negatie" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
  end

  describe "Not special items" do
    it "quality for next day" do
      items = [Item.new("fixme", 2, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 19
    end
    it "quiality after sell-in day" do
      items = [Item.new("fixme", 0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 18
    end
  end

  describe "Aged Brie items " do
    it"increases in quality the older in gets"do
      items = [Item.new("Aged Brie", 2, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 21
    end
    it "quiality after sell-in day" do
      items = [Item.new("Aged Brie", 0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 22
    end
    it "quiality is never more than 50" do
      items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end

  describe "Sulfuras" do
    it "nerver decreases in quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 0, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end
  end

  describe "Backstage passes" do
    it "quality with more than 10 days in sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 41
    end
    it "quality with 10 days or less in sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 42
    end
    it "quality with 5 days or less in sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 43
    end
    it "quality when it get to sell-in" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end
    it "quiality is never more than 50" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
  end

end
