module ApplicationHelper
  def plausible_analytics_tag
    tag.script("", defer: true, data: {domain: "rails.avi.nyc"}, src: "https://a.wip.dev/js/script.js") if Rails.env.production?
  end
end
