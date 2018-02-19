::Sass.load_paths << File.join(root, "node_modules")

# Configure where assets are stored
config[:css_dir] = 'assets/stylesheets'
config[:js_dir] = 'assets/javascripts'
config[:images_dir] = 'assets/images'
config[:images_extensions] = %w( svg jpg jpeg gif png webp )


# Use middleman-livereload
activate :livereload

# Use pretty urls
activate :directory_indexes

page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# Build-specific configuration
configure :build do
  activate :autoprefixer
  activate :minify_html, remove_input_attributes: false
  activate :minify_css
  activate :minify_javascript
  activate :robots, rules:    [{ user_agent: '*', disallow: %w(/) }]
  activate :relative_assets
  activate :asset_hash, :ignore => %r{^assets/public/.*}
  activate :imageoptim
end
