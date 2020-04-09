# Enable 'tasklist' extension in addition to the default setting
GitHub::Markup::Markdown::MARKDOWN_GEMS["commonmarker"] = proc { |content, options: {}|
  commonmarker_opts = [:GITHUB_PRE_LANG].concat(options.fetch(:commonmarker_opts, []))
  commonmarker_exts = options.fetch(:commonmarker_exts, [:tagfilter, :autolink, :table, :tasklist, :strikethrough])
  CommonMarker.render_html(content, commonmarker_opts, commonmarker_exts)
}
