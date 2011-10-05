module ApplicationHelper
  def my_cms_toolbar
      return (current_user.guest?) ? '' : cms_toolbar
  end
end
