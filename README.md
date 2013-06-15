# Dove

Write single page HTML documents with ease.

I sometimes want to quickly draft documents in something other than LaTeX. I've realized
that in the 21^st century HTML pages can easily serve that same purpose DOC, ODT and PDF
files serve. Dove enables you to write your text in Markdown, then generate beautiful web
documents.

Example output can be seen [here](http://archseer.github.io/dove/).

## Note

I was really lazy and didn't want to bother converting Markdown into HTML, then inserting
it into a HTML layout and bothering with syntax highlighting, so I've searched for alternatives.
I've used Jekyll before, but for writing one-page documents I don't really need a full-blown
static website solution. I then I had found [rocco](https://github.com/rtomayko/rocco)
which is a code documentation generator, and I've used a bit of the code from it
to write Dove, a (web) document generator.

## About

Dove takes a Markdown file, converts it using [Redcarpet](https://github.com/vmg/redcarpet), syntax highlights
any code snippets inside using [Rouge](https://github.com/jayferd/rouge), then
it takes a layout file (I use [Slim](http://slim-lang.com/)) and uses [Tilt](https://github.com/rtomayko/tilt)
to render it, and insert the document into the template. It also detects and
extracts any YAML frontmatter and inserts it into the layout as variables!

## Usage

Dove is meant to be used using it's binary file:

```
dove document.md
```

Glob patterns can also be used just as easily:

```
dove *.md README *.txt
```

But one can also require Dove inside a script, and make a new instance of it,
passing in the filename and options, then use the `render` method.

```ruby
dove = Dove.new('document.md', template_file: 'doc_layout.slim')
dove.render
```

Note: The default layout requires `author` and `title` YAML frontmatter.