# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103,W0127
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103,W0127

config.set('colors.webpage.darkmode.threshold.background', 100)
# config.set('colors.webpage.bg', '#222')

# User agent to send.  The following placeholders are defined:  *
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} \
        (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} \
        Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 \
        Firefox/71.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 \
        (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# User agent to send.  The following placeholders are defined:  *
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 \
        Firefox/71.0', 'https://docs.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Valid values: - true - false - ask
config.set('content.notifications', False, 'https://www.reddit.com')
config.set('content.notifications', False, 'https://www.youtube.com')

# Bindings for normal mode
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('x', 'tab-close')
config.bind('<Alt+left>', 'back')
config.bind('<Alt+right>', 'forward')
config.unbind('D')
config.unbind('d')
config.unbind('<Ctrl+h>')
config.bind('<Ctrl+Shift+r>', 'config-source;; message-info "configuration reloaded"')
config.bind('<Ctrl+k>', 'set-cmd-text -s :open ')
config.bind('<Ctrl+shift+k>', 'set-cmd-text -s :open -t ')
config.bind('<Ctrl+w>', 'tab-close', 'insert')
config.bind('<space>', 'scroll-page 0 0.9')
config.bind('<shift+space>', 'scroll-page 0 -0.9')
config.bind('<ctrl+tab>', 'tab-next')
config.bind('<ctrl+shift+tab>', 'tab-prev')
config.bind('ZQ', 'quit')
config.bind('ZZ', 'restart')
config.bind('h', 'open qute://history')
config.bind('<ctrl+u>', 'view-source')

config.set('input.insert_mode.auto_load', True)
config.set('tabs.last_close', 'close')
config.set('session.default_name', 'defaultsession')
config.set('downloads.location.directory', '/tmp')
config.set('auto_save.session', True)
config.set('statusbar.position', 'top')

config.set('colors.tabs.odd.bg', 'grey')
config.set('colors.tabs.odd.fg', 'black')

config.set('colors.tabs.even.bg', 'darkgrey')
config.set('colors.tabs.even.fg', 'black')

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

config.bind('<Ctrl+shift+d>',
            'config-cycle colors.webpage.darkmode.enabled;;\
            config-cycle colors.webpage.prefers_color_scheme_dark;;\
            config-cycle colors.webpage.bg white #222;;\
            restart'
            )
config.bind('\\c', 'config-cycle colors.webpage.darkmode.enabled')
config.bind('\\v', 'config-cycle colors.webpage.prefers_color_scheme_dark')
config.bind('\\b', 'config-cycle colors.webpage.bg white #222')
config.bind('<F9>', 'enter-mode passthrough', mode='normal')
config.bind('<F9>', 'enter-mode passthrough', mode='insert')
config.bind('<F9>', 'enter-mode normal', mode='passthrough')
#
config.bind('<F1>', 'enter-mode passthrough', mode='normal')
config.bind('<F1>', 'enter-mode passthrough', mode='insert')
config.bind('<F1>', 'enter-mode normal', mode='passthrough')

config.bind(',u', 'spawn -d mpv-play {url}')
config.bind(',U', 'hint links spawn -d mpv-play {hint-url}')
config.bind(';U', 'hint links spawn -d mpv --ytdl --ytdl-format=worst {hint-url}')
config.bind(';u', 'hint links spawn -d mpv-play {hint-url};; clear-keychain ')
config.bind('zv', 'hint links spawn -d mpv-play {hint-url};; clear-keychain ')

config.bind('sb', 'open qute://bookmarks#bookmarks')
config.set('hints.chars', 'qwertasdfgzxcvb')
config.bind('CC', \
        'print -f /tmp/qutecap.pdf;;\
        spawn -v -m /home/shawn/bin/qutecap {url:pretty}')
config.bind('tg', 'set-cmd-text -s :tab-give')
config.bind('cr', 'repeat-command')
config.set('session.lazy_restore', True)
config.bind('tt', 'open -t -- {clipboard}')
config.set('scrolling.bar', 'always')
config.set('tabs.background', True)
config.bind("<shift+w>", 'set-cmd-text -s :open -t')
config.bind("<shift+h>", 'open -t qute://history')
config.unbind("<ctrl+a>")
config.bind("cf", "jseval -f remove_fbclid.js")
c.content.user_stylesheets = ['~/.config/qutebrowser/css/scrollbar.css']
