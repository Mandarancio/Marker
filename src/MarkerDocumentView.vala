namespace Marker {
  public class DocumentView : Gtk.Box {
    private Gtk.Paned paned;
    private Gtk.ScrolledWindow editor_scroll;
    private Preview preview;
    private Editor editor;
    private string title;
    
    public File? file { construct; get; default = null; }
    public ViewMode view_mode { set; get; }
    
    public enum ViewMode {
      EDITOR_ONLY,
      PREVIEW_ONLY,
      DUAL_PANE_MODE
    }
  
    public DocumentView () {
      Object (
        orientation: Gtk.Orientation.VERTICAL,
        spacing: 0);
      
      title = "Untitled.md";
      
      init_ui ();
    }
    
    public DocumentView.from_file (File file) {
      Object (
        orientation: Gtk.Orientation.VERTICAL,
        spacing: 0,
        file: file);
      
      title = file.get_basename ();
      
      init_ui ();
    }
    
    private void init_ui () {
      paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
      paned.position = 450;
      
      editor = new Editor ();
      editor.buffer.changed.connect (buffer_changed_cb);
      editor_scroll = new Gtk.ScrolledWindow (null, null);
      editor_scroll.add (editor);
      paned.add1 (editor_scroll);
      
      preview = new Preview ();
      paned.add2 (preview);
      
      pack_start (paned, true, true, 0);
    }
    
    public string get_title () {
      return title;
    }
    
    public void buffer_changed_cb () {
      preview.render (editor.text, Settings.get_css_theme ());
    }
  }
}
