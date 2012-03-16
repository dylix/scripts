try:
    import pynotify
    if pynotify.init("My Application Name"):
        n = pynotify.Notification("Title", "message")
        n.show()
    else:
        print "there was a problem initializing the pynotify module"
except:
    print "you don't seem to have pynotify installed"
