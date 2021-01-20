FROM ruby:2.6.6

RUN apt-get update -qq \
 && apt-get install -y build-essential libpq-dev nodejs 

# download redmine
RUN wget -O /var/www/redmine.zip https://www.redmine.org/releases/redmine-4.1.1.zip \
    && unzip '/var/www/redmine.zip' -d /var/www/redmine \
    && rm /var/www/redmine.zip || true;

# Set working directory
WORKDIR /var/www/redmine

COPY docker/redmine/database.yml config/database.yml
COPY docker/redmine/puma.rb config/puma.rb

# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production' 

# Adding gems
RUN gem install mysql2 \
    && bundle install --jobs 20 --retry 5 \
    && bundle exec rake generate_secret_token

RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]