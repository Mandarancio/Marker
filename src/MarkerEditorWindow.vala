namespace Marker {
  public class EditorWindow : Gtk.ApplicationWindow {
    private Gtk.HeaderBar headerbar;
    private Gtk.Notebook notebook;
    private DocumentView document_view;

    public EditorWindow (Gtk.Application app) {
      Object (application: app);
      
      notebook = new TabbedView ();
      document_view = new DocumentView ();
      notebook.append_page (document_view, new Tab (document_view.get_title ()));
      
      init_ui ();
    }
    
    public EditorWindow.with_file (Gtk.Application app, File file) {
      Object (application: app);
      
      notebook = new TabbedView ();
      document_view = new DocumentView.from_file (file);
      notebook.append_page (document_view, new Tab (document_view.get_title ()));
      
      init_ui ();
    }
    
    private void init_ui () {
      var builder = new Gtk.Builder.from_resource ("/com/github/fabiocolacio/marker/ui/editor-window.ui");
      
      headerbar = (Gtk.HeaderBar) builder.get_object ("headerbar");
      set_titlebar (headerbar);
      
      add (notebook);
      
      set_default_size (900, 600);
      set_position (Gtk.WindowPosition.CENTER);
      
      show_all ();
    }
  }
}

