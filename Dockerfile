FROM ruby
RUN apt-get -y update && \
    apt-get -y install libicu-dev cmake python-docutils && \
    rm -rf /var/lib/apt/lists/*
RUN gem install github-linguist
RUN gem install gollum
RUN gem install commonmarker
RUN gem install asciidoctor
RUN gem install org-ruby
WORKDIR /wiki
ENTRYPOINT ["gollum", "--port", "8080", "--allow-uploads", "page", "--mathjax", "--h1-title", "--user-icons", "gravatar"]
EXPOSE 8080
