namespace Marker {
  int main (string[] args) {
    Application app = new Application ();
	  Settings.load_settings ();
	  return app.run (args);
	}
}
