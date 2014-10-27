module ApplicationHelper
  def is_active? controller, action = ''
    if action == ''
      if params[:controller] == controller
        return 'active'
      end
    else
      if "#{params[:controller]}/#{params[:action]}" == "#{controller}/#{action}"
        return 'active'
      end
    end
    return ''
  end
end
