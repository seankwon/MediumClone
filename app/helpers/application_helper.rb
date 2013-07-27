module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then 'notice_msg'
    when :success then 'success_msg'
    when :error then 'error_msg'
    when :alert then 'alert_msg'
    end
  end
end
