# Configure path for assets
config[:css_dir] = 'assets/stylesheets'
config[:js_dir] = 'assets/javascripts'
config[:images_dir] = 'assets/images'
config[:images_extensions] = %w( svg jpg jpeg gif png webp )
config[:partials_dir] = 'partials'

#
# put list of bowers packages to not include image assets from
# Example:
# config[:exclude_assets] = %w( modernizr open-iconic )
# Default:
config[:exclude_assets] = %w( )

# Configure path for bower assets
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  assets_dir = @bower_config["directory"] # "vendor/assets/bower_components"
  sprockets.append_path File.join "#{root}", assets_dir

  masks = images_extensions.map { |ext| "#{assets_dir}/**/*.#{ext}" }

  # Import all the images from bower assets directory to build/assets/images
  Dir[*masks].each do |file_path|
    relative_path = file_path[("#{assets_dir}/".length)..-1] # e.g.: "open-iconic/png/resize-width.png"

    package_name = relative_path[0..relative_path.index('/')-1]

    unless config[:exclude_assets].include? package_name
      sprockets.import_asset(relative_path) { "assets/images/#{relative_path}" }
    end
  end
end

# Pretty urls
activate :directory_indexes

# Minimize css/js and fix assets for Build
configure :build do 
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  activate :asset_hash
end
