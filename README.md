# Dove

Write single page HTML documents with ease.

## Note

Okay, so I was writing a design document using Markdown. It's easy to write in
but it's not really good to look at. So I needed to generate a HTML file with it.
I was really lazy and didn't want to bother manually converting the document into
HTML, then inserting it into a HTML layout and bothering with syntax highlighting,
so I quickly checked for other solutions.
I've used Jekyll before, but as I write one-page documents, I don't really need
a full-blown website solution. I've found [rocco](https://github.com/rtomayko/rocco)
which is basically a code generator, and I've used a few of the ideas from there
to write Dove, a document generator.

## About

Dove basically takes a Markdown file, converts it using [Redcarpet](https://github.com/vmg/redcarpet), syntax highlights
any code snippets inside using [Rouge](https://github.com/jayferd/rouge), then
it takes a layout file (I use [Slim](http://slim-lang.com/)) and uses [Tilt](https://github.com/rtomayko/tilt)
to render it, and insert the document into the template. It also detects and
extracts any YAML frontmatter and inserts it into the layout as variables!

## Usage

Dove is meant to be used using it's binary file:

```ruby
dove document.md
```

But one can also require Dove inside a script, and make a new instance of it,
passing in the filename and options, then use the ˙render` method.

```ruby
dove = Dove.new('document.md', template_file: 'doc_layout.slim')
dove.render
```