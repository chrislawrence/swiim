module PreferencesHelper
  def get_bgl(value)
    if cookies[:bgl_is_mgdl] == true
      value * 18
    else
      value
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

