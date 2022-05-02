require_relative "../lib/yml_parser"

describe YmlParser do 

  describe "#parse" do 
    
    it "should parse addresses file" do 
      addresses = {"Victoria"=>"Privet Street 13", "John"=>"Elm Street 15", "Charlock"=>"Baker Str. 221b"}
      expect(YmlParser.new("files/addresses.yml").parse).to eq(addresses)      
    end

    it "should parse academic hours file" do 
      academic_hours = {"elementary"=>{"math"=>12, "writing"=>14, "reading"=>10, "music"=>4, "physical_education"=>10}, "middle"=>{"math"=>18, "literature"=>6, "physics"=>6, "biology"=>6, "geography"=>8, "chemestry"=>"on demand"}, "high"=>{"math"=>{"algebra"=>10, "geometry"=>10}, "chemestry"=>{"nonorganic"=>4, "organic"=>4, "practice"=>6}, "literature"=>2, "sociology"=>"optional", "psycology"=>"optional", "astronomy"=>"on demand"}}
      expect(YmlParser.new("files/academic_hours.yml").parse).to eq(academic_hours)
    end

    it "should parse array of trees" do 
      trees = {"trees"=>["oak", "birch", "elm", "pine"]}
      expect(YmlParser.new("files/trees.yml").parse).to eq(trees)
    end

    it "should parse smart house info" do 
      statuses = {"HallLight"=>true, "KitchenLight"=>false, "LivingRoomLight"=>true, "DoorIsLocked"=>true, "BackDoorIsLocked"=>false, "Heater"=>false, "TemperatureUnit"=>"C", "Temperature"=>"19"}
      expect(YmlParser.new("files/smart_house.yml").parse).to eq(statuses)
    end

    it "should parse multilines" do 
      lines = {"singleline"=>"this is a multi-line string it spans more than one line\n", "multiline"=>"this is a multi-line string it\nspans more than one\nline\n"}
      expect(YmlParser.new("files/multilines.yml").parse).to eq(lines)
    end

    it "should parse draft 1" do 
      draft = {"a"=>nil} 
      expect(YmlParser.new("files/draft_1.yml").parse).to eq(draft)
    end

    it "should parse draft 2" do 
      draft = {"is it"=>"valid?"}
      expect(YmlParser.new("files/draft_2.yml").parse).to eq(draft)
    end
        
    it "should return syntax error for draft 3" do 
      expect(YmlParser.new("files/draft_3.yml").parse).to eq("Syntax Error")
    end

  end

end

