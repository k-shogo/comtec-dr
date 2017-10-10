module ComtecDR
  class GpsTrack
    attr_reader :track
    def initialize
      @track = []
    end

    def << log
      @track << log
    end

    # 位置情報を圧縮
    def compress
      new_track = self.class.new
      prev = []
      self.track.each do |t|
        new_track << t unless t[0..2] == prev[0..2]
        prev = t
      end
      new_track
    end

    class << self
      def analyze file_path
        self.new.tap do |track|
          ComtecDR::UdatAnalyzer.analyze(ComtecDR::MovDemuxer.demux file_path).each do |line|
            log = ComtecDR::GpsLog.new *line
            track << [*log.csv_line, Pathname.new(file_path).basename.to_s]
          end
        end
      end
    end
  end
end
