class GpsLog
  def initialize lat, lat_s, lon, lon_s, speed, jst, msec, x_a, y_a, z_a
    @lat      = lat
    @lat_sign = lat_s
    @lon      = lon
    @lon_sign = lon_s
    @speed = speed
    @jst   = jst
    @msec  = msec
    @x_acceleration = x_a
    @y_acceleration = y_a
    @z_acceleration = z_a
  end

  def lat
    (dmm_to_dms(@lat) * (@lat_sign == 'N' ? 1 : -1)).to_f
  end

  def lon
    (dmm_to_dms(@lon) * (@lon_sign == 'E' ? 1 : -1)).to_f
  end

  def speed
    @speed.to_i
  end

  def jst
    Time.parse "20#{@jst}}+0900"
  end

  def msec
    @msec.to_i
  end

  def x_acceleration
    @x_acceleration.to_f/10000
  end

  def y_acceleration
    @y_acceleration.to_f/10000
  end

  def z_acceleration
    @z_acceleration.to_f/10000
  end

  def csv_line
    [lat, lon, speed, jst, msec, x_acceleration, y_acceleration, z_acceleration]
  end

  private
  # DMM形式から変換
  def dmm_to_dms str
    number, fractional = str.split('.')
    number[0...-2].to_r + "#{number[-2..-1]}.#{fractional}".to_r / 60
  end
end
