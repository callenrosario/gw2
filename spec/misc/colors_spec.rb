require "spec_helper"

describe GW2::Misc do
  describe "methods" do
    context "#colors" do
      before :each do
        @colors = {
          "126" => {
            "name" => "Hot Pink",
            "base_rgb" => [ 128, 26, 26 ],
            "cloth" => {
              "brightness" => 14,
              "contrast" => 1.21094,
              "hue" => 340,
              "saturation" => 0.820313,
              "lightness" => 1.44531,
              "rgb" => [ 169, 54, 94 ]
            },
            "leather" => {
              "brightness" => 14,
              "contrast" => 1.21094,
              "hue" => 340,
              "saturation" => 0.703125,
              "lightness" => 1.44531,
              "rgb" => [ 160, 62, 96 ]
            },
            "metal" => {
              "brightness" => 14,
              "contrast" => 1.21094,
              "hue" => 340,
              "saturation" => 0.585938,
              "lightness" => 1.44531,
              "rgb" => [ 151, 69, 98 ]
            }
          }
        }

        stub_request(:get, "https://api.guildwars2.com/v1/colors.json").
          to_return(:status => 200, :body => { "colors" => @colors }.to_json)
      end

      it "exists" do
        GW2::Misc.respond_to?(:colors).should == true
      end

      it "returns the correct JSON parsed data" do
        GW2::Misc.colors.should == { "colors" => @colors }
      end
    end
  end
end
