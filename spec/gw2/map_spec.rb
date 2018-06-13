require "spec_helper"

describe GW2::Map do
  describe ".continents" do
    before :each do
      @continent = [
        {
          "name"=>"Tyria",
          "continent_dims"=>[32768, 32768],
          "min_zoom"=>0,
          "max_zoom"=>7,
          "floors"=>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 18, -2, -3, -4, -5, -6, -7, -8, -9, -10, -11, -13, -14, -15, -16, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 34, 36, 37, 40, 38, 39, 42, 44, 45, 46],
          "id"=>1
        },
        {
          "name"=>"Mists",
          "continent_dims"=>[16384, 16384],
          "min_zoom"=>0,
          "max_zoom"=>6,
          "floors"=>[1, 3, 5, 6, 7, 9, 10, 13, 14, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, -27, -28, -29, -30, -31, 35, 32],
          "id"=>2
        }
      ]
    end

    it "exists" do
      expect(GW2::Map.respond_to?(:continents)).to eq(true)
    end

    it "returns all continents", :vcr do
      expect(GW2::Map.continents).to eq(@continent)
    end
  end

  describe ".all" do
    before :each do
      @map = {"id"=>80,
              "name"=>"A Society Function",
              "min_level"=>10,
              "max_level"=>10,
              "default_floor"=>1,
              "floors"=>[1, 2],
              "region_id"=>8,
              "region_name"=>"Steamspur Mountains",
              "continent_id"=>1,
              "continent_name"=>"Tyria",
              "map_rect"=>[[-21504, -21504], [24576, 21504]],
              "continent_rect"=>[[10240, 9856], [12160, 11648]]
      }
    end

    it "exists" do
      expect(GW2::Map.respond_to?(:all)).to eq(true)
    end

    it "returns all maps", :vcr do
      expect(GW2::Map.details("80")).to eq(@map)
    end
  end

  describe ".map_floor" do
    it "exists" do
      expect(GW2::Map.respond_to?(:floor)).to eq(true)
    end

    it "returns a specific map floor", :vcr do
      expect(GW2::Map.floor(1, 1)["regions"]["1"]["name"]).to eq("Shiverpeak Mountains")
    end
  end
end
