# -*- encoding : utf-8 -*-
module ChuyiHelper

  class Railtie < Rails::Railtie
    initializer "chuyi_helper" do
      ActionView::Base.send :include, ChuyiHelper
    end
  end

end
