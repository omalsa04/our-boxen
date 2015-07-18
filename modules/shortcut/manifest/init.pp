# IMPORTANT: Put this in ./modules/shortcut/manifests/init.pp inside your boxen
# repository. For example, /opt/boxen/repo/modules/shortcut/manifests/init.pp.
 
# Public: Define a keyboard shortcut for an app. To define the shortcuts, you
# must assign a key combination to a menu item in the app. You also need the
# name of the app as identified internally by OS X.
#
# To find the name of the app, you can run the following command:
#
#     osascript -e 'id of app "$APP"'
#
# Where "$APP" is the name of the executable. For example:
#
#     $ osascript -e 'id of app "iTerm"'
#     > com.googlecode.iterm2
#
# Once you have that, adding shortcuts is as easy as declaring the shortcut with
# the following syntax:
#
# ``` puppet
# shortcut { "com.googlecode.iterm2":
#   key  => "cmd-shift-f",
#   menu => "Toggle Full Screen"
# }
# ```
#
# If you want to define multiple shortcuts for the same app, you can explicitly
# define the app like so:
#
# ``` puppet
# shortcut {
#   "iTerm Full Screen":
#     app  => "com.googlecode.iterm2",
#     key  => "cmd-shift-f",
#     menu => "Toggle Full Screen";
#   "No accidentally quitting iTerm":
#     app  => "com.googlecode.iterm2",
#     key  => nil,
#     menu => "Quit iTerm";
# }
# ```
define shortcut ($app = $title, $menu, $key) {
  $shortcut = regsubst(regsubst(regsubst(regsubst($key, "cmd-", "@"), "ctrl-", "^"), "alt-|opt-", "~"), "shift-", "\$")
 
  exec { "${key} => ${menu}":
    command => "defaults write ${app} NSUserKeyEquivalents -dict-add '${menu}' '${shortcut}'",
    unless  => "defaults read ${app} NSUserKeyEquivalents | grep '${menu}'"
  }
}
