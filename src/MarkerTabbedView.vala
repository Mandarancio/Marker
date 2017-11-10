namespace Marker {
  public class TabbedView : Gtk.Notebook {
    public TabbedView () {
      Object ();
      
      page_added.connect (page_added_cb);
      page_removed.connect (page_removed_cb);
    }
    
    public void page_added_cb (Gtk.Widget widget, uint page_num) {
      set_show_tabs (get_n_pages () > 1);
    }
    
    public void page_removed_cb (Gtk.Widget widget, uint page_num) {
      set_show_tabs (get_n_pages () > 1);
    }
  }
  
  public class Tab : Gtk.Box {
    public string text { construct set; get; }
    
    public Tab (string text) {
      Object (
        orientation: Gtk.Orientation.HORIZONTAL,
        spacing: 5,
        text: text);
        
      pack_start (new Gtk.Label (text), false, false);
      pack_start (new Gtk.Button.from_icon_name ("window-close-symbolic"), false, false);
      
      show_all ();
    }
  }
}
