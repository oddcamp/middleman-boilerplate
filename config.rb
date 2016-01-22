# Configure where assets are stored
config[:css_dir] = 'assets/stylesheets'
config[:js_dir] = 'assets/javascripts'
config[:images_dir] = 'assets/images'

# Pull in assets installed from Bower
@bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
bower_assets_dir = @bower_config["directory"]
sprockets.append_path File.join app.root, bower_assets_dir


# Use pretty urls `www.example.com/blog`
activate :directory_indexes

# Use middleman-livereload
activate :livereload

# Minimize css/js and fix assets for Build
configure :build do
  activate :autoprefixer
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  activate :asset_hash
end
