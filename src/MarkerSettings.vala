namespace Marker {
  namespace Settings {
    private GLib.Settings window_settings;
    private GLib.Settings editor_settings;
    private GLib.Settings preview_settings;
    
    public void load_settings () {
      window_settings = new GLib.Settings ("com.github.fabiocolacio.marker.preferences.window");
      editor_settings = new GLib.Settings ("com.github.fabiocolacio.marker.preferences.editor");
      preview_settings = new GLib.Settings ("com.github.fabiocolacio.marker.preferences.preview");
    }
    
    public DocumentView.ViewMode get_default_view_mode () {
      return (DocumentView.ViewMode) window_settings.get_enum ("view-mode");
    }
    
    public void set_default_view_mode (DocumentView.ViewMode view_mode) {
      window_settings.set_enum ("view-mode", view_mode);
    }
    
    public bool get_use_gnome_appmenu () {
      return window_settings.get_boolean ("gnome-appmenu");
    }
    
    public void set_use_gnome_appmenu (bool val) {
      window_settings.set_boolean ("gnome-appmenu", val);
    }
    
    public string get_css_theme () {
      return preview_settings.get_string ("css-theme");
    }
    
    public void set_css_theme (string theme) {
      preview_settings.set_string ("css-theme", theme);
    }
    
    public bool get_highlight_current_line () {
      return editor_settings.get_boolean ("highlight-current-line");
    }
    
    public void set_highlight_current_line (bool val) {
      editor_settings.set_boolean ("highlight-current-line", val);
    }
    
    public bool get_show_line_numbers () {
      return editor_settings.get_boolean ("show-line-numbers");
    }
    
    public void set_show_line_numbers (bool val) {
      editor_settings.set_boolean ("show-line-numbers", val);
    }
    
    public bool get_show_right_margin () {
      return editor_settings.get_boolean ("show-right-margin");
    }
    
    public void set_show_right_margin (bool val) {
      editor_settings.set_boolean ("show-right-margin", val);
    }
    
    public bool get_wrap_text () {
      return editor_settings.get_boolean ("wrap-text");
    }
    
    public void set_wrap_text (bool val) {
      editor_settings.set_boolean ("wrap-text", val);
    }
    
    public string get_syntax_theme () {
      return editor_settings.get_string ("syntax-theme");
    }
    
    public void set_stynax_theme (string theme) {
      editor_settings.set_string ("syntax-theme", theme);
    }
  }
}

