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
      "#{value * 18} mg/dL"
    else
      "#{value} mmol/L"
    end
  end

  def get_bgl_units
    if cookies[:bgl_is_mgdl] == true
      "mg/dL"
    else
      "mmol/L"
    end
  end
end

