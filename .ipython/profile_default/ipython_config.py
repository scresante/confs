c = get_config()
c.InteractiveShell.confirm_exit = False
c.TerminalIPythonApp.display_banner = False
c.InteractiveShellApp.extensions = [
#    'autotime',
]
c.InteractiveShell.editor = 'vim'
