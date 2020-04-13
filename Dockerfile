FROM ruby
RUN apt -y update && \
    apt -y upgrade && \
    apt -y install libicu-dev cmake python-docutils && \
    rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN gem install gollum
RUN gem install commonmarker
RUN gem install asciidoctor
RUN gem install org-ruby
RUN sed -i.orig \
        -e '8i <link rel="icon" type="image/png" href="{{base_url}}/favicon.png" sizes="512x512">' \
        -e '8i <link rel="apple-touch-icon" type="image/png" href="{{base_url}}/favicon.png" sizes="512x512">' \
        /usr/local/bundle/gems/gollum-5.0.1/lib/gollum/templates/layout.mustache
COPY config.rb /
ENV LANG C.UTF-8
WORKDIR /wiki
ENTRYPOINT ["gollum", "--config", "/config.rb", "--bare", "--allow-uploads", "page", "--mathjax", "--h1-title", "--user-icons", "gravatar"]
EXPOSE 4567
