module ComtecDR
  class UdatAnalyzer
    LOG_PATTERN = /
    A
    (?<lat>[\d.]*)(?<lat_sign>[NS])
    (?<lon>[\d.]*)(?<lon_sign>[EW])
    (?<speed>\d{4})
    (?<jst>\d{12})
    (?:\s+?)
    (?<time>\d{5})
    (?<x_acceleration>[\d-]{1}\d{4})
    (?<y_acceleration>[\d-]{1}\d{4})
    (?<z_acceleration>[\d-]{1}\d{4})
    /x

    class << self
      def analyze udat
        udat.to_s.gsub(/[[:cntrl:]]/,"").scan(LOG_PATTERN)
      end
    end
  end
end
