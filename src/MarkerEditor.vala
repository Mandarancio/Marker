namespace Marker {
  public class Editor : Gtk.SourceView {  
    public string text {
      set {
        buffer.text = value;
      }
      
      owned get {
        return buffer.text;
      }
    }
    
    public bool modified {
      set {
        buffer.set_modified (value);
      }
      
      get {
        return buffer.get_modified ();
      }
    }
  
    public Editor () {
      var language_manager = Gtk.SourceLanguageManager.get_default ();
      var language = language_manager.get_language ("markdown");
      ((Gtk.SourceBuffer) buffer).set_language (language);
      
      set_monospace (true);
    }
    
    public void open_file (File file) {    
      uint8[] contents;
      string etag_out;
      
      try {
        file.load_contents(null, out contents, out etag_out);
        buffer.text = (string) contents;
      } catch (Error e) {
        stdout.printf("Error opening the file: %s\n%s", file.get_path (), e.message);
      }
      
      modified = false;
    }
  }
}
