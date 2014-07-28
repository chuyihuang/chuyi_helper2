# -*- encoding : utf-8 -*-
module ChuyiHelper2

  class Railtie < Rails::Railtie
    initializer "chuyi_helper2" do
      ActionView::Base.send :include, ChuyiHelper2
    end
  end

end
