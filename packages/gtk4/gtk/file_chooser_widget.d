/// Module for [FileChooserWidget] class
module gtk.file_chooser_widget;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.file_chooser;
import gtk.file_chooser_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.file_chooser_widget.FileChooserWidget] is a widget for choosing files.
    
    It exposes the [gtk.file_chooser.FileChooser] interface, and you should
    use the methods of this interface to interact with the
    widget.
    
    # CSS nodes
    
    [gtk.file_chooser_widget.FileChooserWidget] has a single CSS node with name filechooser.

    Deprecated: Direct use of [gtk.file_chooser_widget.FileChooserWidget] is deprecated
*/
class FileChooserWidget : gtk.widget.Widget, gtk.file_chooser.FileChooser
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
    return cast(void function())gtk_file_chooser_widget_get_type != &gidSymbolNotFound ? gtk_file_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FileChooserWidget self()
  {
    return this;
  }

  /** */
  @property bool searchMode()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("search-mode");
  }

  /** */
  @property void searchMode(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("search-mode", propval);
  }

  /**
      Get `showTime` property.
      Returns: Whether to show the time.
  */
  @property bool showTime()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-time");
  }

  /** */
  @property string subtitle()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("subtitle");
  }

  mixin FileChooserT!();

  /**
      Creates a new [gtk.file_chooser_widget.FileChooserWidget].
      
      This is a file chooser widget that can be embedded in custom
      windows, and it is the same widget that is used by
      [gtk.file_chooser_dialog.FileChooserDialog].
  
      Params:
        action = Open or save mode for the widget
      Returns: a new [gtk.file_chooser_widget.FileChooserWidget]
  
      Deprecated: Direct use of [gtk.file_chooser_widget.FileChooserWidget] is deprecated
  */
  this(gtk.types.FileChooserAction action)
  {
    GtkWidget* _cretval;
    _cretval = gtk_file_chooser_widget_new(action);
    this(_cretval, No.Take);
  }

  /**
      Connect to `DesktopFolder` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser show the user's Desktop
        folder in the file list.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>D</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDesktopFolder(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("desktop-folder", closure, after);
  }

  /**
      Connect to `DownFolder` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser go to a child of the
        current folder in the file hierarchy. The subfolder that will
        be used is displayed in the path bar widget of the file chooser.
        For example, if the path bar is showing "/foo/bar/baz", with bar
        currently displayed, then this will cause the file chooser to
        switch to the "baz" subfolder.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>Down</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDownFolder(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("down-folder", closure, after);
  }

  /**
      Connect to `HomeFolder` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser show the user's home
        folder in the file list.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>Home</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectHomeFolder(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("home-folder", closure, after);
  }

  /**
      Connect to `LocationPopup` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser show a "Location" prompt which
        the user can use to manually type the name of the file he wishes to select.
        
        The default bindings for this signal are <kbd>Control</kbd>-<kbd>L</kbd>
        with a path string of "" (the empty string). It is also bound to
        <kbd>/</kbd> with a path string of "`/`" (a slash):  this lets you
        type `/` and immediately type a path name. On Unix systems, this is
        bound to <kbd>~</kbd> (tilde) with a path string of "~" itself for
        access to home directories.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string path, gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `path` a string that gets put in the text entry for the file name (optional)
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLocationPopup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.file_chooser_widget.FileChooserWidget)))
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
    return connectSignalClosure("location-popup", closure, after);
  }

  /**
      Connect to `LocationPopupOnPaste` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser show a "Location" prompt
        when the user pastes into a [gtk.file_chooser_widget.FileChooserWidget].
        
        The default binding for this signal is <kbd>Control</kbd>-<kbd>V</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLocationPopupOnPaste(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-popup-on-paste", closure, after);
  }

  /**
      Connect to `LocationTogglePopup` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to toggle the visibility of a "Location" prompt
        which the user can use to manually type the name of the file
        he wishes to select.
        
        The default binding for this signal is <kbd>Control</kbd>-<kbd>L</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLocationTogglePopup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("location-toggle-popup", closure, after);
  }

  /**
      Connect to `PlacesShortcut` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to move the focus to the places sidebar.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>P</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPlacesShortcut(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("places-shortcut", closure, after);
  }

  /**
      Connect to `QuickBookmark` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser switch to the bookmark
        specified in the bookmark_index parameter. For example, if
        you have three bookmarks, you can pass 0, 1, 2 to this signal
        to switch to each of them, respectively.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>1</kbd>,
        <kbd>Alt</kbd>-<kbd>2</kbd>, etc. until <kbd>Alt</kbd>-<kbd>0</kbd>.
        Note that in the default binding, that <kbd>Alt</kbd>-<kbd>1</kbd> is
        actually defined to switch to the bookmark at index 0, and so on
        successively.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int bookmarkIndex, gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `bookmarkIndex` the number of the bookmark to switch to (optional)
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectQuickBookmark(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.file_chooser_widget.FileChooserWidget)))
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
    return connectSignalClosure("quick-bookmark", closure, after);
  }

  /**
      Connect to `RecentShortcut` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser show the Recent location.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>R</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRecentShortcut(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("recent-shortcut", closure, after);
  }

  /**
      Connect to `SearchShortcut` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser show the search entry.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>S</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSearchShortcut(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-shortcut", closure, after);
  }

  /**
      Connect to `ShowHidden` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser display hidden files.
        
        The default binding for this signal is <kbd>Control</kbd>-<kbd>H</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShowHidden(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-hidden", closure, after);
  }

  /**
      Connect to `UpFolder` signal.
  
      Emitted when the user asks for it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        This is used to make the file chooser go to the parent
        of the current folder in the file hierarchy.
        
        The default binding for this signal is <kbd>Alt</kbd>-<kbd>Up</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.file_chooser_widget.FileChooserWidget fileChooserWidget))
  
          `fileChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUpFolder(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.file_chooser_widget.FileChooserWidget)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("up-folder", closure, after);
  }
}
