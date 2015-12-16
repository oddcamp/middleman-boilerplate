This is the boilerplate for [Kollegornas](https://github.com/kollegorna) Middleman projects. We're currently using Middleman 3.

## Local setup

1. Make sure you have [the same Ruby version installed as the repo](https://github.com/kollegorna/middleman-boilerplate/blob/master/.ruby-version).
2. Install [Bundler](https://rubygems.org/gems/bundler) and [Node.js](http://nodejs.org).
3. Clone repository
4. ``$ npm install && gulp install``

### Gulp commands

The following gulp commands are at your service…

```$ gulp middleman```

Runs bundle exec middleman

```$ gulp install```

Runs bundle install and bower install

```$ gulp serve```

Builds Middleman and create a BrowserSync server that watches all changes

```$ gulp build```

Builds Middleman

```$ gulp deploy```

Builds Middleman and deploys with rsync

```$ gulp s3```

Builds Middleman and deploys to s3 bucket

### Configuration

#### Deployment

If you're planning to use rsync for deployment then you have to change the configuration:

[gulpfile.js](https://github.com/kollegorna/middleman-boilerplate/blob/master/gulpfile.js#L33)

By default it's configured to deploy to one of our VPS:s.

#### Deploy to Amazon S3

Create a file called aws.json in the root directory with the following content:

```
{
  "key": "aws_key",
  "secret": "aws_secret",
  "bucket": "bucket_name",
  "region": "region_name"
}
```

(This file must not be committed to git. It's included in .gitignore.)

Add the following line of code just after you've required the modules in gulpfile.js

```aws = JSON.parse(fs.readFileSync('./aws.json'));```
