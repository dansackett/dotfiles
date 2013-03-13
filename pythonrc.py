import os
import atexit
import readline


# Get pprint everytime
import __main__ as main
if hasattr(main, '__file__'):
    from pprint import pprint


# history is good
HISTORY_PATH = os.path.expanduser("~/.pyhistory")  # where to store history
HISTORY_LENGTH = 2000  # how many of lines of history to store


# save/restore history
def save_history(path=HISTORY_PATH, length=HISTORY_LENGTH):
    import readline
    readline.set_history_length(length)
    readline.write_history_file(path)


if os.path.exists(HISTORY_PATH):
    readline.read_history_file(HISTORY_PATH)


atexit.register(save_history)


# do not litter!
del os, atexit, readline, main, save_history, HISTORY_PATH, HISTORY_LENGTH


# project specific imports
# try:
#     # django
#     from django.contrib.auth.models import User

#     # myvelocity
#     from uberdb.models import *
#     from uberauth.uber_pass import *
#     try:
#         u = User.objects.get(username='client-1077')
#         p = u.get_profile()
#         uu = p.get_uber_user()
#     except:
#         pass
# except ImportError:
#     pass
