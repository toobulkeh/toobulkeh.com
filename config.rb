require "extensions/views"

# DATA_EXT = ".yml"

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

configure :development do
  activate :livereload
end

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

helpers do
  def api(page)
    "#{API_PREFIX}/#{page}.json"
  end
  def markdown(data)
    Tilt['md'].new { data }.render
  end
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
