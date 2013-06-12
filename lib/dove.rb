require 'redcarpet'
require 'tilt'
require 'slim'
require 'yaml'
require 'rouge'
require 'dove/rougify'

class Dove
  def initialize(filename, options ={})
    @file = filename

    # When `block` is given, it must read the contents of the file using
    # whatever means necessary and return it as a string. With no `block`,
    # the file is read to retrieve data.
    @data, @yaml_data = read_yaml(if block_given? then yield else File.read(filename) end)

    @options =  {
      :output_dir    => '.',
      :template_file => 'layout.slim',
      #:stylesheet    => 'styles.css'
    }.merge(options)
  end

  # Extracts the YAML frontmatter
  def read_yaml text
    if md = text.match(/\A(---\s*\n.*?\n?)^(---\s*$\n?)/m)
      [md.post_match, YAML.load(md[1])]
    else
      [text, {}]
    end
  end

  def render
    extensions = {
      autolink:             true,
      space_after_headers:  true,
      fenced_code_blocks:   true,
      lax_spacing:          true,
      strikethrough:        true,
      superscript:          true
    }
    markdown = Redcarpet::Markdown.new(Rougify, extensions)
    Tilt.new(@options[:template_file], {pretty: true}).render(Object.new, @yaml_data) { markdown.render(@data) }
  end
end