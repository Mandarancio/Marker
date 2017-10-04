namespace Hoedown {
  
  [Compact]
  [CCode (cheader_filename = "buffer.h", cname = "hoedown_buffer", free_function = "hoedown_buffer_free")]
  public class Buffer {
    
    [CCode (cname = "hoedown_buffer_new")]
    public Buffer (size_t growth_unit);  
    
    [CCode (cname = "hoedown_buffer_reset")]
    public void reset ();
    
    [CCode (cname = "hoedown_buffer_grow")]
    public void grow (size_t new_size);
    
    [CCode (cname = "hoedown_buffer_put")]
    public void put (uint8[] data);
    
    [CCode (cname = "hoedown_buffer_puts")]
    public void puts (string str);
    
    [CCode (cname = "hoedown_buffer_putc")]
    public void putc (uint8 c);
    
    [CCode (cname = "hoedown_buffer_putf")]
    public int putf (Posix.FILE file);
    
    [CCode (cname = "hoedown_buffer_set")]
    public void set (uint8[] data);
    
    [CCode (cname = "hoedown_buffer_sets")]
    public void sets (string str);
    
    [CCode (cname = "hoedown_buffer_eq")]
    public int equals (uint8[] data);
    
    [CCode (cname = "hoedown_buffer_eqs")]
    public int equals_string (string str);
    
    [CCode (cname = "hoedown_buffer_prefix")]
    public int has_prefix (string str);
    
    [CCode (cname = "hoedown_buffer_slurp")]
    public void slurp (size_t size);
    
    [CCode (cname = "hoedown_buffer_cstr")]
    public unowned string? to_string ();
    
    [CCode (cname = "hoedown_buffer_printf")]
    public void printf (string format, ...);
    
    [CCode (cname = "hoedown_buffer_put_utf8")]
    public void put_utf8 (uint codepoint);
    
  }
  
  [Compact]
  [CCode (cheader_filename = "html.h", cname = "hoedown_renderer", free_function = "hoedown_html_renderer_free")]
  public class HTMLRenderer {
  
    [CCode (cname = "hoedown_html_flags", cprefix="HOEDOWN_HTML_")]
    [Flags]
    public enum Flags {
      SKIP_HTML,
      ESCAPE,
      HARD_WRAP,
      USE_XHTML
    }
    
    [CCode (cname = "hoedown_html_tag", cprefix = "HOEDOWN_HTML_TAG")]
    public enum Tag {
      NONE,
      OPEN,
      CLOSE
    }
    
    [CCode (cname = "hoedown_html_renderer_new")]
    public HTMLRenderer (Flags render_flags = 0, int nesting_level = 16);
    
  }
  
  [Compact]
  [CCode (cheader_filename = "document.h", cname = "hoedown_document", free_function = "hoedown_document_free")]
  public class Document {
    
    [CCode (cname = "hoedown_extensions", cprefix = "HOEDOWN_EXT_")]
    [Flags]
    public enum Extensions {
      TABLES,
      FENCED_CODE,
      FOOTNOTES,
      
      AUTOLINK,
      STRIKETHROUGH,
      UNDERLINE,
      HIGHLIGHT,
      QUOTE,
      SUPERSCRIPT,
      MATH,
      
      NO_INTRA_EMPHASIS,
      SPACE_HEADERS,
      MATH_EXPLICIT,
      
      DISABLE_INDENTED_CODE
    }
    
    [CCode (cname = "hoedown_document_new")]
    public Document (HTMLRenderer renderer, Extensions extensions, size_t max_nesting = 16);
    
    [CCode (cname = "hoedown_document_render")]
    public void render (Buffer buffer, uint8[] data);
    
    [CCode (cname = "hoedown_document_render_inline")]
    public void render_inline (Buffer buffer, uint8[] data);
    
  }
  
}

