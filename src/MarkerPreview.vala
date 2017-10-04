namespace Marker {
  public class Preview : WebKit.WebView {
    public Preview () {
    
    }
    
    public void render (string markdown, string? stylesheet = null, string? base_uri = null) {
      string? html = markdown_to_html (markdown, stylesheet);
      
      if (html != null) {
        load_html (html, base_uri ?? "file://");
      }
    }
  }
}

