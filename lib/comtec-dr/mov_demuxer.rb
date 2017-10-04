module ComtecDR
  class MovDemuxer
    class << self
      def demux mov_path
        io = File.open mov_path

        while length = io.read(4)
          size = length.unpack('H*').first.to_i(16)
          seek = size - 8
          code = io.read(4)
          if code == 'udat'
            return io.read(seek)
          else
            io.seek(seek, IO::SEEK_CUR)
          end
        end
      end
    end
  end
end
