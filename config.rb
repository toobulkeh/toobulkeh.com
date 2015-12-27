require "extensions/views"
# require 'stringex'
# require 'time'
# require 'rack/google_analytics'

# DATA_EXT = ".yml"
# API_PREFIX = "/api/v1"
# GOOGLE_ANALYTICS = "UA-0000000-1"

# Reload the browser automatically whenever files change
configure :development do
  set :file_watcher_ignore, [
      /^\.idea\//,
      /^\.bundle\//,
      /^\.git\//,
      /^\.gitignore$/,
      /\.DS_Store/,
      /^build\//,
      /^\.rbenv-.*$/,
      /^Gemfile$/,
      /^Gemfile\.lock$/,
      /~$/,
      /(^|\/)\.?#/
  ]
  activate :livereload
end

# use Rack::GoogleAnalytics,
#   :web_property_id => GOOGLE_ANALYTICS

# Dir["data/*"].each do |path|
#     name = File.basename path, DATA_EXT
#     proxy "#{API_PREFIX}/#{name}.json", "/api.json",
#       locals: { collection: name }
# end

activate :views
activate :directory_indexes
activate :autoprefixer

set :relative_links, true
set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"
set :layout, "layouts/application"

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
  # deploy.branch = "gh-pages"
end

helpers do
  # def api(page)
  #   "#{API_PREFIX}/#{page}.json"
  # end
  # def markdown(data)
  #   Tilt['md'].new { data }.render
  # end
  def nav_link(link_text, page_url, options = {})
    options[:class] ||= ""
    if current_page.url.length > 1
      current_url = current_page.url.chop
    else
      current_url = current_page.url
    end
    options[:class] << " active" if page_url == current_url
    link_to(link_text, page_url, options)
  end
end
