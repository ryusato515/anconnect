module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :danger then "bg-customgreen"
    when :success then "bg-customgreen"
    when :error  then "bg-customorange"
    else "bg-gray-500"
    end
  end
end
