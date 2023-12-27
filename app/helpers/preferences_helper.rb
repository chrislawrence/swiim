module PreferencesHelper
  def get_bgl(value)
    if cookies[:units] == "mg/dL"
      value * 18
    else
      value
    end
  end

  def get_units
    cookies[:units]
  end

  def get_bgl_with_units(value)
    if cookies[:units] == "mg/dL"
      "#{(value * 18).round(0)} mg/dL"
    else
      "#{value} mmol/L"
    end
  end

  def get_hbA1c(value)
    if cookies[:hbA1c] == "mmol/mol"
      "#{((10.93 * value) - 23.5).round(0)} mmol/mol"
    else
      "#{value}%"
    end
  end
end

