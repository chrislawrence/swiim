module ApplicationHelper
  def current_controller?(names)
    names.include?(controller.controller_name)
  end
end
