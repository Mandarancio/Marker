namespace Marker {
  public class Application : Gtk.Application {
    public Application () {
      Object (application_id: "com.github.fabiocolacio.marker",
              flags: ApplicationFlags.HANDLES_OPEN);
    }
    
    protected override void activate () {
	    new EditorWindow (this);
	  }
	
	  public override void open (File[] files, string hint) {
	    foreach (File file in files) {
	      new EditorWindow.with_file (this, file);
	    }
	  }
	
	  public static int main (string[] args) {
	    Application app = new Application ();
	    return app.run (args);
	  }
  }
}

