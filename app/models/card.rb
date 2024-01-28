class Card
  attr_accessor :units_per_exchange, :correction_factor, :low_bgl, :high_bgl, :non_bolus, :half_units

  def initialize(params = {})
    @units_per_exchange = params.fetch(:units_per_exchange, 1)
    @correction_factor = params.fetch(:correction_factor, 0.1)
    @low_bgl = params.fetch(:low_bgl, 4)
    @high_bgl = params.fetch(:high_bgl, 6)
    @non_bolus = params.fetch(:non_bolus, 1)
    @half_units = params.fetch(:half_units, true)
  end

  def dose(exchanges, bgl)
    bgl = bgl.floor
    units = exchanges * @units_per_exchange
    if bgl < @low_bgl 
      if exchanges > @non_bolus
        units -= @non_bolus * @units_per_exchange
      else
        units = 0
      end
    end

    if bgl > @high_bgl
      units += (bgl - @high_bgl) * @correction_factor
    end
    if @half_units
      units = (units * 2).floor / 2.0
    else 
      units = units.floor
    end
    return units
  end

  def to_display(total_exchanges)
    bgl = 1
    rows = []
    header_row = [""]
    for i in 0..total_exchanges
      header_row << i
    end
    rows << header_row
    
    while bgl <= 18
      row = []
      exchange = 0
      row << bgl
      while exchange <= total_exchanges
        row << self.dose(exchange,bgl)
        exchange += 1
      end
      rows << row
      bgl += 1
    end
    rows
  end
end
