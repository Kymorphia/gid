/// Module for [Plug] class
module gtk.plug;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.display;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;
import xlib.types;

/**
    Together with #GtkSocket, #GtkPlug provides the ability to embed
    widgets from one process into another process in a fashion that is
    transparent to the user. One process creates a #GtkSocket widget
    and passes the ID of that widget’s window to the other process,
    which then creates a #GtkPlug with that window ID. Any widgets
    contained in the #GtkPlug then will appear inside the first
    application’s window.
    
    The communication between a #GtkSocket and a #GtkPlug follows the
    [XEmbed Protocol](http://www.freedesktop.org/Standards/xembed-spec).
    This protocol has also been implemented in other toolkits, e.g. Qt,
    allowing the same level of integration when embedding a Qt widget
    in GTK+ or vice versa.
    
    The #GtkPlug and #GtkSocket widgets are only available when GTK+
    is compiled for the X11 platform and `GDK_WINDOWING_X11` is defined.
    They can only be used on a #GdkX11Display. To use #GtkPlug and
    #GtkSocket, you need to include the `gtk/gtkx.h` header.
*/
class Plug : gtk.window.Window
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
    return cast(void function())gtk_plug_get_type != &gidSymbolNotFound ? gtk_plug_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Plug self()
  {
    return this;
  }

  /**
      Get `embedded` property.
      Returns: true if the plug is embedded in a socket.
  */
  @property bool embedded()
  {
    return getEmbedded();
  }

  /**
      Get `socketWindow` property.
      Returns: The window of the socket the plug is embedded in.
  */
  @property gdk.window.Window socketWindow()
  {
    return getSocketWindow();
  }

  /**
      Creates a new plug widget inside the #GtkSocket identified
      by socket_id. If socket_id is 0, the plug is left “unplugged” and
      can later be plugged into a #GtkSocket by  [gtk.socket.Socket.addId].
  
      Params:
        socketId = the window ID of the socket, or 0.
      Returns: the new #GtkPlug widget.
  */
  this(xlib.types.Window socketId)
  {
    GtkWidget* _cretval;
    _cretval = gtk_plug_new(socketId);
    this(_cretval, No.Take);
  }

  /**
      Create a new plug widget inside the #GtkSocket identified by socket_id.
  
      Params:
        display = the #GdkDisplay on which socket_id is displayed
        socketId = the XID of the socket’s window.
      Returns: the new #GtkPlug widget.
  */
  static gtk.plug.Plug newForDisplay(gdk.display.Display display, xlib.types.Window socketId)
  {
    GtkWidget* _cretval;
    _cretval = gtk_plug_new_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, socketId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.plug.Plug)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finish the initialization of plug for a given #GtkSocket identified by
      socket_id. This function will generally only be used by classes deriving from #GtkPlug.
  
      Params:
        socketId = the XID of the socket’s window.
  */
  void construct(xlib.types.Window socketId)
  {
    gtk_plug_construct(cast(GtkPlug*)this._cPtr, socketId);
  }

  /**
      Finish the initialization of plug for a given #GtkSocket identified by
      socket_id which is currently displayed on display.
      This function will generally only be used by classes deriving from #GtkPlug.
  
      Params:
        display = the #GdkDisplay associated with socket_id’s
               #GtkSocket.
        socketId = the XID of the socket’s window.
  */
  void constructForDisplay(gdk.display.Display display, xlib.types.Window socketId)
  {
    gtk_plug_construct_for_display(cast(GtkPlug*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, socketId);
  }

  /**
      Determines whether the plug is embedded in a socket.
      Returns: true if the plug is embedded in a socket
  */
  bool getEmbedded()
  {
    bool _retval;
    _retval = cast(bool)gtk_plug_get_embedded(cast(GtkPlug*)this._cPtr);
    return _retval;
  }

  /**
      Gets the window ID of a #GtkPlug widget, which can then
      be used to embed this window inside another window, for
      instance with [gtk.socket.Socket.addId].
      Returns: the window ID for the plug
  */
  xlib.types.Window getId()
  {
    xlib.types.Window _retval;
    _retval = gtk_plug_get_id(cast(GtkPlug*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the socket the plug is embedded in.
      Returns: the window of the socket, or null
  */
  gdk.window.Window getSocketWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_plug_get_socket_window(cast(GtkPlug*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `Embedded` signal.
  
      Gets emitted when the plug becomes embedded in a socket.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.plug.Plug plug))
  
          `plug` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEmbedded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.plug.Plug)))
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
    return connectSignalClosure("embedded", closure, after);
  }
}
