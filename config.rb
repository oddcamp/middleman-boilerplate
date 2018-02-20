activate :livereload

activate :external_pipeline,
         name: :webpack,
         command: build? ?  "yarn run build" : "yarn run start",
         source: ".tmp/dist",
         latency: 1

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascript'
set :images_dir, 'images'

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :relative_assets
  activate :asset_hash, :ignore => [/^public/]
  activate :imageoptim do |options|
    options.pngout    = false
    options.svgo      = false
  end
end
