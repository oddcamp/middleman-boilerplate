This is the boilerplate for [Kollegornas](https://github.com/kollegorna) Middleman projects. We're currently using Middleman 3.

## Local setup

1. Make sure you have [the same Ruby version installed as the repo](https://github.com/kollegorna/middleman-boilerplate/blob/master/.ruby-version).
2. Install [Bundler](https://rubygems.org/gems/bundler) and [Node.js](http://nodejs.org).
3. Clone repository
4. ``$ npm install``
5. ``$ gulp install``

### Gulp commands

Runs bundle install and bower install

```$ gulp install```

Builds Middleman and create a BrowserSync server that watches all changes

```$ gulp serve```

Builds Middleman

```$ gulp build```

Builds Middleman and deploys with rsync

```$ gulp deploy```

### Configuration

#### Deployment

If you're planning to use rsync for deployment then you have to change the configuration:

[gulpfile.js](https://github.com/kollegorna/middleman-boilerplate/blob/master/gulpfile.js#L33)

By default it's configured to deploy to one of our VPS:s.
