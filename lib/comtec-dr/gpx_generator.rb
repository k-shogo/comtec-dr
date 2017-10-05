module ComtecDR
  class GpxGenerator
    def initialize filename
      @filename = filename
      @doc = REXML::Document.new
      @gpx = REXML::Element.new('gpx')

      @gpx.add_attributes({
        'creator' => "comtec-dr-ruby/#{ComtecDR::VERSION}",
        'version' => "1.1",
        'xmlns' => 'http://www.topografix.com/GPX/1/1',
        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'xsi:schemaLocation' => 'http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd'
      })
      @doc.add_element(@gpx)

      @trk = REXML::Element.new('trk')
      @gpx.add_element(@trk)
    end

    def add_trkseg csv
      trkseg = REXML::Element.new('trkseg')
      @trk.add_element(trkseg)
      csv.each do |line|
        trkpt = REXML::Element.new('trkpt')
        trkpt.add_attributes({'lat' => line[0], 'lon' => line[1]})
        trkseg.add_element(trkpt)
      end
    end


    def write
      File.open(@filename, 'w') do |file|
        @doc.write(file, indent=2)
      end
    end
  end
end
