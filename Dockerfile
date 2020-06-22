FROM selenium/standalone-chrome

WORKDIR /home/selenium-chrome-ruby

USER root

RUN apt-get update && apt-get install -y software-properties-common && apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev && apt-add-repository ppa:brightbox/ruby-ng && apt-get update && apt-get install -y ruby2.6 ruby2.6-dev && gem install bundler

COPY . .

RUN chmod +x /entrypoint.sh

RUN gem install bundler

RUN bundle install

ENTRYPOINT ["sh","/entrypoint.sh"]
