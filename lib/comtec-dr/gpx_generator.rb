module ComtecDR
  class GpxGenerator
    def initialize filename
      @filename = filename
      @doc = REXML::Document.new
      @doc << REXML::XMLDecl.new('1.0', 'UTF-8')
      @gpx = REXML::Element.new('gpx')

      @gpx.add_attributes({
        'creator' => "comtec-dr-ruby/#{ComtecDR::VERSION}",
        'version' => "1.1",
        'xmlns' => 'http://www.topografix.com/GPX/1/1',
        'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
        'xsi:schemaLocation' => 'http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd'
      })
      @doc.add_element(@gpx)
    end

    def add_track track = nil
      @trk = REXML::Element.new('trk')
      @gpx.add_element(@trk)

      add_trkseg track if !track.nil?
    end

    def add_trkseg track
      trkseg = REXML::Element.new('trkseg')
      @trk.add_element(trkseg)

      track.track.each do |t|
        trkpt = REXML::Element.new('trkpt')
        trkpt.add_attributes({'lat' => t.lat, 'lon' => t.lon})

        time = REXML::Element.new('time')
        time.add_text(t.jst.utc.iso8601)
        trkpt.add_element(time)

        speed = REXML::Element.new('speed')
        speed.add_text((t.speed.to_f * 1000 / 3600).to_s)
        trkpt.add_element(speed)

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
