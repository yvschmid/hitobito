# encoding: utf-8

#  Copyright (c) 2012-2016, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

class ChangelogController < ApplicationController
  skip_authorization_check

  def index

  end

  private

  def devise_controller?
    true # hence, no login required
  end
end
