namespace Marker {
  string markdown_to_html (string markdown, string? stylesheet_location = null) {
    var buffer = new Hoedown.Buffer (50);
    
    var renderer = new Hoedown.HTMLRenderer ();
    
    var extensions =
      Hoedown.Document.Extensions.TABLES |
      Hoedown.Document.Extensions.FENCED_CODE |
      Hoedown.Document.Extensions.FOOTNOTES |
      
      Hoedown.Document.Extensions.AUTOLINK |
      Hoedown.Document.Extensions.STRIKETHROUGH |
      Hoedown.Document.Extensions.UNDERLINE |
      Hoedown.Document.Extensions.HIGHLIGHT |
      Hoedown.Document.Extensions.QUOTE |
      Hoedown.Document.Extensions.SUPERSCRIPT |
      Hoedown.Document.Extensions.MATH |
      
      Hoedown.Document.Extensions.NO_INTRA_EMPHASIS |
      Hoedown.Document.Extensions.SPACE_HEADERS |
      Hoedown.Document.Extensions.MATH_EXPLICIT;
      
    var document = new Hoedown.Document (renderer, extensions);
    
    var builder = new StringBuilder ();
    builder.append (
    """
    <!doctype html>
    <html>
      <header>
        <meta charset="UTF-8">
    """);
    
    if (stylesheet_location != null) {
      builder.append ("<link rel=\"stylesheet\" type=\"text/css\" href=\"%s\">".printf (stylesheet_location));
    }
    
    builder.append (
    """
      </header>
      <body>
    """);
    
    document.render (buffer, markdown.data);
    
    builder.erase ();
    
    builder.append (
    """
      </body>
    </html>
    """
    );
    
    buffer.puts (builder.str);
    
    var html = buffer.to_string ();
    
    stdout.printf ("%s\n", html);
    
    return html;
  }
}

