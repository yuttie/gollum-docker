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
COPY config.rb /
ENV LANG C.UTF-8
WORKDIR /wiki
ENTRYPOINT ["gollum", "--config", "/config.rb", "--bare", "--allow-uploads", "page", "--mathjax", "--h1-title", "--user-icons", "gravatar"]
EXPOSE 4567
