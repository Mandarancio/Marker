project('Marker', 'vala', 'c')

PREFIX = get_option('prefix')
DATA_DIR = join_paths(PREFIX, 'share')
APP_DIR = join_paths(DATA_DIR, 'com.github.fabiocolacio.marker')
STYLES_DIR = join_paths(APP_DIR, 'styles')

EXECUTABLE_NAME = 'com.github.fabiocolacio.marker'

gnome = import('gnome')

res = gnome.compile_resources(
  'marker_resources',
  'src/resources/marker.gresource.xml',
  source_dir : 'src/resources'
)

marker_sources = [
  'src/MarkerApplication.vala',
  'src/MarkerEditorWindow.vala',
  'src/MarkerPreview.vala',
  'src/MarkerEditor.vala',
  'src/MarkerMarkdown.vala',
  'src/MarkerSettings.vala',
  res
]

hoedown_sources = [
  'src/hoedown/autolink.c',
  'src/hoedown/buffer.c',
  'src/hoedown/document.c',
  'src/hoedown/escape.c',
  'src/hoedown/html.c',
  'src/hoedown/html_blocks.c',
  'src/hoedown/html_smartypants.c',
  'src/hoedown/stack.c',
  'src/hoedown/version.c'
]

sources = [
  marker_sources, hoedown_sources
]

deps = [
  dependency('gtk+-3.0'),
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('webkit2gtk-4.0'),
  dependency('gtksourceview-3.0')
]

custom_includes = [
  include_directories('src/hoedown')
]

add_project_arguments(
  [
    '--vapidir', join_paths(meson.current_source_dir(), 'vapi'),
    '--pkg', 'hoedown',
    '--pkg', 'posix'
  ],
  language : 'vala'
)

executable(
  EXECUTABLE_NAME,
  sources : sources,
  dependencies : deps,
  include_directories : custom_includes,
  install : true
)

