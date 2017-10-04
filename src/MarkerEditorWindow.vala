namespace Marker {
  public class EditorWindow : Gtk.ApplicationWindow {
    private Gtk.HeaderBar headerbar;
    private Gtk.Paned paned;
    private Preview preview;
    private Editor editor;
    private Gtk.ScrolledWindow editor_scroll;
    private Gtk.ScrolledWindow preview_scroll;
    
    public File? file {
      construct; get; default = null;
    }

    public EditorWindow (Gtk.Application app) {
      Object (application: app);
      
      init_ui ();
    }
    
    public EditorWindow.with_file (Gtk.Application app, File file) {
      Object (application: app, file: file);
      
      init_ui ();
      editor.open_file (file);
    }
    
    private void init_ui () {
      var builder = new Gtk.Builder.from_resource ("/com/github/fabiocolacio/marker/ui/editor-window.ui");
      
      headerbar = (Gtk.HeaderBar) builder.get_object ("headerbar");
      set_titlebar (headerbar);
      
      paned = new Gtk.Paned (Gtk.Orientation.HORIZONTAL);
      paned.position = 450;
      add (paned);
      
      editor_scroll = new Gtk.ScrolledWindow (null, null);
      editor = new Editor ();
      editor.buffer.changed.connect (buffer_changed);
      editor_scroll.add(editor);
      paned.add1(editor_scroll);
      
      preview_scroll = new Gtk.ScrolledWindow (null, null);
      preview = new Preview ();
      preview_scroll.add(preview);
      paned.add2(preview_scroll);
      
      set_default_size (900, 600);
      update_title ();
      
      show_all ();
    }
    
    private void buffer_changed () {
      string? uri = null;
      if (file != null) {
        uri = file.get_uri ();
      }
      
      preview.render (editor.text, null, uri);
    }
    
    public void update_title () {
      string title = "Untitled.md";
      headerbar.has_subtitle = false;
      
      if (file != null) {
        title = file.get_basename ();
        
        string path = file.get_path ();
        headerbar.subtitle = path[0 : -title.length];
      }
      
      if (editor.modified) {
        title = @"*$title";
      }
      
      headerbar.title = title;
    }
  }
}

