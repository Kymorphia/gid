/// Module for [Clipboard] class
module gtk.clipboard;

import gdk.atom;
import gdk.display;
import gdk.event_owner_change;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.selection_data;
import gtk.target_entry;
import gtk.text_buffer;
import gtk.types;

/**
    The #GtkClipboard object represents a clipboard of data shared
    between different processes or between different widgets in
    the same process. Each clipboard is identified by a name encoded as a
    #GdkAtom. (Conversion to and from strings can be done with
    [gdk.atom.Atom.intern] and [gdk.atom.Atom.name].) The default clipboard
    corresponds to the “CLIPBOARD” atom; another commonly used clipboard
    is the “PRIMARY” clipboard, which, in X, traditionally contains
    the currently selected text.
    
    To support having a number of different formats on the clipboard
    at the same time, the clipboard mechanism allows providing
    callbacks instead of the actual data.  When you set the contents
    of the clipboard, you can either supply the data directly (via
    functions like [gtk.clipboard.Clipboard.setText]), or you can supply a
    callback to be called at a later time when the data is needed (via
    [gtk.clipboard.Clipboard.setWithData] or [gtk.clipboard.Clipboard.setWithOwner].)
    Providing a callback also avoids having to make copies of the data
    when it is not needed.
    
    [gtk.clipboard.Clipboard.setWithData] and [gtk.clipboard.Clipboard.setWithOwner]
    are quite similar; the choice between the two depends mostly on
    which is more convenient in a particular situation.
    The former is most useful when you want to have a blob of data
    with callbacks to convert it into the various data types that you
    advertise. When the @clear_func you provided is called, you
    simply free the data blob. The latter is more useful when the
    contents of clipboard reflect the internal state of a #GObject
    (As an example, for the PRIMARY clipboard, when an entry widget
    provides the clipboard’s contents the contents are simply the
    text within the selected region.) If the contents change, the
    entry widget can call [gtk.clipboard.Clipboard.setWithOwner] to update
    the timestamp for clipboard ownership, without having to worry
    about @clear_func being called.
    
    Requesting the data from the clipboard is essentially
    asynchronous. If the contents of the clipboard are provided within
    the same process, then a direct function call will be made to
    retrieve the data, but if they are provided by another process,
    then the data needs to be retrieved from the other process, which
    may take some time. To avoid blocking the user interface, the call
    to request the selection, [gtk.clipboard.Clipboard.requestContents] takes a
    callback that will be called when the contents are received (or
    when the request fails.) If you don’t want to deal with providing
    a separate callback, you can also use [gtk.clipboard.Clipboard.waitForContents].
    What this does is run the GLib main loop recursively waiting for
    the contents. This can simplify the code flow, but you still have
    to be aware that other callbacks in your program can be called
    while this recursive mainloop is running.
    
    Along with the functions to get the clipboard contents as an
    arbitrary data chunk, there are also functions to retrieve
    it as text, [gtk.clipboard.Clipboard.requestText] and
    [gtk.clipboard.Clipboard.waitForText]. These functions take care of
    determining which formats are advertised by the clipboard
    provider, asking for the clipboard in the best available format
    and converting the results into the UTF-8 encoding. (The standard
    form for representing strings in GTK+.)
*/
class Clipboard : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_clipboard_get_type != &gidSymbolNotFound ? gtk_clipboard_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Clipboard self()
  {
    return this;
  }

  /**
      Returns the clipboard object for the given selection.
      See [gtk.clipboard.Clipboard.getForDisplay] for complete details.
  
      Params:
        selection = a #GdkAtom which identifies the clipboard to use
      Returns: the appropriate clipboard object. If no clipboard
            already exists, a new one will be created. Once a clipboard
            object has been created, it is persistent and, since it is
            owned by GTK+, must not be freed or unreffed.
  */
  static gtk.clipboard.Clipboard get(gdk.atom.Atom selection)
  {
    GtkClipboard* _cretval;
    _cretval = gtk_clipboard_get(selection ? cast(GdkAtom)selection._cPtr : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(GtkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the default clipboard object for use with cut/copy/paste menu items
      and keyboard shortcuts.
  
      Params:
        display = the #GdkDisplay for which the clipboard is to be retrieved.
      Returns: the default clipboard object.
  */
  static gtk.clipboard.Clipboard getDefault(gdk.display.Display display)
  {
    GtkClipboard* _cretval;
    _cretval = gtk_clipboard_get_default(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(GtkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the clipboard object for the given selection.
      Cut/copy/paste menu items and keyboard shortcuts should use
      the default clipboard, returned by passing `GDK_SELECTION_CLIPBOARD` for selection.
      (`GDK_NONE` is supported as a synonym for GDK_SELECTION_CLIPBOARD
      for backwards compatibility reasons.)
      The currently-selected object or text should be provided on the clipboard
      identified by #GDK_SELECTION_PRIMARY. Cut/copy/paste menu items
      conceptually copy the contents of the #GDK_SELECTION_PRIMARY clipboard
      to the default clipboard, i.e. they copy the selection to what the
      user sees as the clipboard.
      
      (Passing #GDK_NONE is the same as using `gdk_atom_intern
      ("CLIPBOARD", FALSE)`.
      
      See the
      [FreeDesktop Clipboard Specification](http://www.freedesktop.org/Standards/clipboards-spec)
      for a detailed discussion of the “CLIPBOARD” vs. “PRIMARY”
      selections under the X window system. On Win32 the
      #GDK_SELECTION_PRIMARY clipboard is essentially ignored.)
      
      It’s possible to have arbitrary named clipboards; if you do invent
      new clipboards, you should prefix the selection name with an
      underscore (because the ICCCM requires that nonstandard atoms are
      underscore-prefixed), and namespace it as well. For example,
      if your application called “Foo” has a special-purpose
      clipboard, you might call it “_FOO_SPECIAL_CLIPBOARD”.
  
      Params:
        display = the #GdkDisplay for which the clipboard is to be retrieved or created.
        selection = a #GdkAtom which identifies the clipboard to use.
      Returns: the appropriate clipboard object. If no
          clipboard already exists, a new one will be created. Once a clipboard
          object has been created, it is persistent and, since it is owned by
          GTK+, must not be freed or unrefd.
  */
  static gtk.clipboard.Clipboard getForDisplay(gdk.display.Display display, gdk.atom.Atom selection)
  {
    GtkClipboard* _cretval;
    _cretval = gtk_clipboard_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, selection ? cast(GdkAtom)selection._cPtr : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(GtkClipboard*)_cretval, No.Take);
    return _retval;
  }

  /**
      Clears the contents of the clipboard. Generally this should only
      be called between the time you call [gtk.clipboard.Clipboard.setWithOwner]
      or [gtk.clipboard.Clipboard.setWithData],
      and when the clear_func you supplied is called. Otherwise, the
      clipboard may be owned by someone else.
  */
  void clear()
  {
    gtk_clipboard_clear(cast(GtkClipboard*)this._cPtr);
  }

  /**
      Gets the #GdkDisplay associated with clipboard
      Returns: the #GdkDisplay associated with clipboard
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_clipboard_get_display(cast(GtkClipboard*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      If the clipboard contents callbacks were set with
      [gtk.clipboard.Clipboard.setWithOwner], and the [gtk.clipboard.Clipboard.setWithData] or
      [gtk.clipboard.Clipboard.clear] has not subsequently called, returns the owner set
      by [gtk.clipboard.Clipboard.setWithOwner].
      Returns: the owner of the clipboard, if any;
            otherwise null.
  */
  gobject.object.ObjectWrap getOwner()
  {
    GObject* _cretval;
    _cretval = gtk_clipboard_get_owner(cast(GtkClipboard*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the selection that this clipboard is for.
      Returns: the selection
  */
  gdk.atom.Atom getSelection()
  {
    GdkAtom _cretval;
    _cretval = gtk_clipboard_get_selection(cast(GtkClipboard*)this._cPtr);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Requests the contents of clipboard as the given target.
      When the results of the result are later received the supplied callback
      will be called.
  
      Params:
        target = an atom representing the form into which the clipboard
              owner should convert the selection.
        callback = A function to call when the results are received
              (or the retrieval fails). If the retrieval fails the length field of
              selection_data will be negative.
  */
  void requestContents(gdk.atom.Atom target, gtk.types.ClipboardReceivedFunc callback)
  {
    extern(C) void _callbackCallback(GtkClipboard* clipboard, GtkSelectionData* selectionData, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gtk.types.ClipboardReceivedFunc*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(void*)clipboard, No.Take), selectionData ? new gtk.selection_data.SelectionData(cast(void*)selectionData, No.Take) : null);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_clipboard_request_contents(cast(GtkClipboard*)this._cPtr, target ? cast(GdkAtom)target._cPtr : null, _callbackCB, _callback);
  }

  /**
      Requests the contents of the clipboard as image. When the image is
      later received, it will be converted to a #GdkPixbuf, and
      callback will be called.
      
      The pixbuf parameter to callback will contain the resulting
      #GdkPixbuf if the request succeeded, or null if it failed. This
      could happen for various reasons, in particular if the clipboard
      was empty or if the contents of the clipboard could not be
      converted into an image.
  
      Params:
        callback = a function to call when the image is received,
              or the retrieval fails. (It will always be called one way or the other.)
  */
  void requestImage(gtk.types.ClipboardImageReceivedFunc callback)
  {
    extern(C) void _callbackCallback(GtkClipboard* clipboard, GdkPixbuf* pixbuf, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gtk.types.ClipboardImageReceivedFunc*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(void*)clipboard, No.Take), gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(void*)pixbuf, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_clipboard_request_image(cast(GtkClipboard*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Requests the contents of the clipboard as rich text. When the rich
      text is later received, callback will be called.
      
      The text parameter to callback will contain the resulting rich
      text if the request succeeded, or null if it failed. The length
      parameter will contain text’s length. This function can fail for
      various reasons, in particular if the clipboard was empty or if the
      contents of the clipboard could not be converted into rich text form.
  
      Params:
        buffer = a #GtkTextBuffer
        callback = a function to call when the text is received,
              or the retrieval fails. (It will always be called one way or the other.)
  */
  void requestRichText(gtk.text_buffer.TextBuffer buffer, gtk.types.ClipboardRichTextReceivedFunc callback)
  {
    extern(C) void _callbackCallback(GtkClipboard* clipboard, GdkAtom format, const(char)* text, size_t length, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gtk.types.ClipboardRichTextReceivedFunc*)data;
      char[] _text;
      _text.length = length;
      _text[0 .. length] = text[0 .. length];

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(void*)clipboard, No.Take), format ? new gdk.atom.Atom(cast(void*)format, No.Take) : null, _text);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_clipboard_request_rich_text(cast(GtkClipboard*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Requests the contents of the clipboard as text. When the text is
      later received, it will be converted to UTF-8 if necessary, and
      callback will be called.
      
      The text parameter to callback will contain the resulting text if
      the request succeeded, or null if it failed. This could happen for
      various reasons, in particular if the clipboard was empty or if the
      contents of the clipboard could not be converted into text form.
  
      Params:
        callback = a function to call when the text is received,
              or the retrieval fails. (It will always be called one way or the other.)
  */
  void requestText(gtk.types.ClipboardTextReceivedFunc callback)
  {
    extern(C) void _callbackCallback(GtkClipboard* clipboard, const(char)* text, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gtk.types.ClipboardTextReceivedFunc*)data;
      string _text = text.fromCString(No.Free);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(void*)clipboard, No.Take), _text);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_clipboard_request_text(cast(GtkClipboard*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Requests the contents of the clipboard as URIs. When the URIs are
      later received callback will be called.
      
      The uris parameter to callback will contain the resulting array of
      URIs if the request succeeded, or null if it failed. This could happen
      for various reasons, in particular if the clipboard was empty or if the
      contents of the clipboard could not be converted into URI form.
  
      Params:
        callback = a function to call when the URIs are received,
              or the retrieval fails. (It will always be called one way or the other.)
  */
  void requestUris(gtk.types.ClipboardURIReceivedFunc callback)
  {
    extern(C) void _callbackCallback(GtkClipboard* clipboard, char** uris, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gtk.types.ClipboardURIReceivedFunc*)data;
      string[] _uris;
      uint _lenuris;
      if (uris)
        for (; uris[_lenuris] !is null; _lenuris++)
        break;
      _uris.length = _lenuris;
      foreach (i; 0 .. _lenuris)
        _uris[i] = uris[i].fromCString(No.Free);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.clipboard.Clipboard)(cast(void*)clipboard, No.Take), _uris);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_clipboard_request_uris(cast(GtkClipboard*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Hints that the clipboard data should be stored somewhere when the
      application exits or when gtk_clipboard_store () is called.
      
      This value is reset when the clipboard owner changes.
      Where the clipboard data is stored is platform dependent,
      see gdk_display_store_clipboard () for more information.
  
      Params:
        targets = array containing
                    information about which forms should be stored or null
                    to indicate that all forms should be stored.
  */
  void setCanStore(gtk.target_entry.TargetEntry[] targets = null)
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    GtkTargetEntry[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
    const(GtkTargetEntry)* _targets = _tmptargets.ptr;
    gtk_clipboard_set_can_store(cast(GtkClipboard*)this._cPtr, _targets, _nTargets);
  }

  /**
      Sets the contents of the clipboard to the given #GdkPixbuf.
      GTK+ will take responsibility for responding for requests
      for the image, and for converting the image into the
      requested format.
  
      Params:
        pixbuf = a #GdkPixbuf
  */
  void setImage(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    gtk_clipboard_set_image(cast(GtkClipboard*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }

  /**
      Sets the contents of the clipboard to the given UTF-8 string. GTK+ will
      make a copy of the text and take responsibility for responding
      for requests for the text, and for converting the text into
      the requested format.
  
      Params:
        text = a UTF-8 string.
        len = length of text, in bytes, or -1, in which case
                      the length will be determined with strlen().
  */
  void setText(string text, int len)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_clipboard_set_text(cast(GtkClipboard*)this._cPtr, _text, len);
  }

  /**
      Stores the current clipboard data somewhere so that it will stay
      around after the application has quit.
  */
  void store()
  {
    gtk_clipboard_store(cast(GtkClipboard*)this._cPtr);
  }

  /**
      Requests the contents of the clipboard using the given target.
      This function waits for the data to be received using the main
      loop, so events, timeouts, etc, may be dispatched during the wait.
  
      Params:
        target = an atom representing the form into which the clipboard
                   owner should convert the selection.
      Returns: a newly-allocated #GtkSelectionData object or null
                      if retrieving the given target failed. If non-null,
                      this value must be freed with [gtk.selection_data.SelectionData.free]
                      when you are finished with it.
  */
  gtk.selection_data.SelectionData waitForContents(gdk.atom.Atom target)
  {
    GtkSelectionData* _cretval;
    _cretval = gtk_clipboard_wait_for_contents(cast(GtkClipboard*)this._cPtr, target ? cast(GdkAtom)target._cPtr : null);
    auto _retval = _cretval ? new gtk.selection_data.SelectionData(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Requests the contents of the clipboard as image and converts
      the result to a #GdkPixbuf. This function waits for
      the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
      Returns: a newly-allocated #GdkPixbuf
            object which must be disposed with [gobject.object.ObjectWrap.unref], or
            null if retrieving the selection data failed. (This could
            happen for various reasons, in particular if the clipboard
            was empty or if the contents of the clipboard could not be
            converted into an image.)
  */
  gdkpixbuf.pixbuf.Pixbuf waitForImage()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_clipboard_wait_for_image(cast(GtkClipboard*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Requests the contents of the clipboard as rich text.  This function
      waits for the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
  
      Params:
        buffer = a #GtkTextBuffer
        format = return location for the format of the returned data
      Returns: a
                      newly-allocated binary block of data which must be
                      freed with [glib.global.gfree], or null if retrieving the
                      selection data failed. (This could happen for various
                      reasons, in particular if the clipboard was empty or
                      if the contents of the clipboard could not be
                      converted into text form.)
  */
  ubyte[] waitForRichText(gtk.text_buffer.TextBuffer buffer, out gdk.atom.Atom format)
  {
    ubyte* _cretval;
    size_t _cretlength;
    GdkAtom _format;
    _cretval = gtk_clipboard_wait_for_rich_text(cast(GtkClipboard*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null, &_format, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
      gFree(cast(void*)_cretval);
    }
    format = new gdk.atom.Atom(cast(void*)&_format, No.Take);
    return _retval;
  }

  /**
      Requests the contents of the clipboard as text and converts
      the result to UTF-8 if necessary. This function waits for
      the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
      Returns: a newly-allocated UTF-8 string which must
                      be freed with [glib.global.gfree], or null if retrieving
                      the selection data failed. (This could happen
                      for various reasons, in particular if the
                      clipboard was empty or if the contents of the
                      clipboard could not be converted into text form.)
  */
  string waitForText()
  {
    char* _cretval;
    _cretval = gtk_clipboard_wait_for_text(cast(GtkClipboard*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Requests the contents of the clipboard as URIs. This function waits
      for the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
      Returns: a newly-allocated null-terminated array of strings which must
            be freed with [glib.global.strfreev], or null if retrieving the
            selection data failed. (This could happen for various reasons,
            in particular if the clipboard was empty or if the contents of
            the clipboard could not be converted into URI form.)
  */
  string[] waitForUris()
  {
    char** _cretval;
    _cretval = gtk_clipboard_wait_for_uris(cast(GtkClipboard*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Test to see if there is an image available to be pasted
      This is done by requesting the TARGETS atom and checking
      if it contains any of the supported image targets. This function
      waits for the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
      
      This function is a little faster than calling
      [gtk.clipboard.Clipboard.waitForImage] since it doesn’t need to retrieve
      the actual image data.
      Returns: true is there is an image available, false otherwise.
  */
  bool waitIsImageAvailable()
  {
    bool _retval;
    _retval = cast(bool)gtk_clipboard_wait_is_image_available(cast(GtkClipboard*)this._cPtr);
    return _retval;
  }

  /**
      Test to see if there is rich text available to be pasted
      This is done by requesting the TARGETS atom and checking
      if it contains any of the supported rich text targets. This function
      waits for the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
      
      This function is a little faster than calling
      [gtk.clipboard.Clipboard.waitForRichText] since it doesn’t need to retrieve
      the actual text.
  
      Params:
        buffer = a #GtkTextBuffer
      Returns: true is there is rich text available, false otherwise.
  */
  bool waitIsRichTextAvailable(gtk.text_buffer.TextBuffer buffer)
  {
    bool _retval;
    _retval = cast(bool)gtk_clipboard_wait_is_rich_text_available(cast(GtkClipboard*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Checks if a clipboard supports pasting data of a given type. This
      function can be used to determine if a “Paste” menu item should be
      insensitive or not.
      
      If you want to see if there’s text available on the clipboard, use
      gtk_clipboard_wait_is_text_available () instead.
  
      Params:
        target = A #GdkAtom indicating which target to look for.
      Returns: true if the target is available, false otherwise.
  */
  bool waitIsTargetAvailable(gdk.atom.Atom target)
  {
    bool _retval;
    _retval = cast(bool)gtk_clipboard_wait_is_target_available(cast(GtkClipboard*)this._cPtr, target ? cast(GdkAtom)target._cPtr : null);
    return _retval;
  }

  /**
      Test to see if there is text available to be pasted
      This is done by requesting the TARGETS atom and checking
      if it contains any of the supported text targets. This function
      waits for the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
      
      This function is a little faster than calling
      [gtk.clipboard.Clipboard.waitForText] since it doesn’t need to retrieve
      the actual text.
      Returns: true is there is text available, false otherwise.
  */
  bool waitIsTextAvailable()
  {
    bool _retval;
    _retval = cast(bool)gtk_clipboard_wait_is_text_available(cast(GtkClipboard*)this._cPtr);
    return _retval;
  }

  /**
      Test to see if there is a list of URIs available to be pasted
      This is done by requesting the TARGETS atom and checking
      if it contains the URI targets. This function
      waits for the data to be received using the main loop, so events,
      timeouts, etc, may be dispatched during the wait.
      
      This function is a little faster than calling
      [gtk.clipboard.Clipboard.waitForUris] since it doesn’t need to retrieve
      the actual URI data.
      Returns: true is there is an URI list available, false otherwise.
  */
  bool waitIsUrisAvailable()
  {
    bool _retval;
    _retval = cast(bool)gtk_clipboard_wait_is_uris_available(cast(GtkClipboard*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `OwnerChange` signal.
  
      The ::owner-change signal is emitted when GTK+ receives an
      event that indicates that the ownership of the selection
      associated with clipboard has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gdk.event_owner_change.EventOwnerChange event, gtk.clipboard.Clipboard clipboard))
  
          `event` the GdkEventOwnerChange event (optional)
  
          `clipboard` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectOwnerChange(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gdk.event_owner_change.EventOwnerChange)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.clipboard.Clipboard)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("owner-change", closure, after);
  }
}
