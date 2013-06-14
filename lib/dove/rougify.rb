require 'rouge/plugins/redcarpet'
class Rougify < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet # use Rouge with Redcarpet
end