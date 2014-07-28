# -*- encoding : utf-8 -*-
require "chuyi_helper/version"
require "chuyi_helper/railtie" if defined? Rails

module ChuyiHelper

    #畫面上方的訊息列
  def chuyi_message_box
    css_class = ""
    content = ""
    if flash[:notice].present?
      css_class = "alert alert-warning fade in"
      content = flash[:notice]
    elsif flash[:error].present?
      css_class = "alert alert-danger fade in"
      content = flash[:error]
    elsif flash[:success].present?
      css_class = "alert alert-success fade in"
      content = flash[:success]
    elsif flash[:info].present?
      content = flash[:info]
      css_class = "alert alert-info fade in"
    else
      return nil
    end
    return content_tag(:div, class: css_class) do
      if flash[:error].present?
        content = (content_tag(:h4) {"OOPS！需要您的注意！"} + content).html_safe
      end
      button_tag(raw("&times;"), {class: "close", "data-dismiss" => "alert", "aria-hidden" => true}) + content
    end.html_safe
  end

  #主選單
  def menu_item(controllers, opt = {}, &block)
    if opt[:path].blank? || opt[:name].blank?
      raise "missing important params"
    end
    klass = opt[:klass] || "active"
    actions = opt[:actions] || []
    #判斷路徑與css
    klass = controllers.include?(controller_name) ? klass : nil
    if actions.empty?
      content_tag(:li, class: klass) do
        if block_given?
          yield
        else
          link_to(opt[:name], opt[:path])
        end
      end
    else
      klass = actions.include?(action_name.to_sym) ? klass : nil
      content_tag(:li, class: klass) do
        if block_given?
          yield
        else
          link_to(opt[:name], opt[:path])
        end
      end
    end
  end

  def ymd(datetime, gap = "/")
    datetime.strftime("%Y#{gap}%m#{gap}%d")
  end

  def ymdhm(datetime, gap = "/")
    datetime.strftime("%Y#{gap}%m#{gap}%d %H:%M")
  end

  def admin_status(item, path)
    text = "未知"
    css = "btn btn-default"
    case item.status
    when "enabled"
      text = "啟動"
      css = "btn btn-success"
    when "disabled"
      text = "取消"
      css = "btn btn-warning"
    when "replied"
      text = "已回覆"
      css = "btn btn-success"
    when "unreplied"
      text = "未回覆"
      css = "btn btn-danger"
    when "done"
      text = "已完成"
      css = "btn btn-success"
    when "doing"
      text = "處理中"
      css = "btn btn-info"
    when "undo"
      text = "未完成"
      css = "btn btn-warning"
    end
    link_to(text, path, {class: css, method: :patch}).html_safe
  end

  def yes_or_no(status)
    case status
    when "yes"
      "是"
    when "no"
      "否"
    else
      "不明"
    end
  end

  def enum_choise(status)
    case status
    when 0
      "取消"
    when 1
      "啟動"
    else
      "不明"
    end
  end

  def gender(gender, opt = {})
    opt[:male] ||= "男"
    opt[:female] ||= "女"
    opt[:unknown] ||= "不明"
    case gender
    when "male"
      opt[:male]
    when "female"
      opt[:female]
    else
      opt[:unknown]
    end
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def is_email?(email)
    !!(email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
  end

  def is_url?(url)
    !!(url =~ /^http(|s):\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/i)
  end
end
