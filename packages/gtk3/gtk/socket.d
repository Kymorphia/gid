/// Module for [Socket] class
module gtk.socket;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import xlib.types;

/**
    Together with #GtkPlug, #GtkSocket provides the ability to embed
    widgets from one process into another process in a fashion that
    is transparent to the user. One process creates a #GtkSocket widget
    and passes that widget’s window ID to the other process, which then
    creates a #GtkPlug with that window ID. Any widgets contained in the
    #GtkPlug then will appear inside the first application’s window.
    
    The socket’s window ID is obtained by using [gtk.socket.Socket.getId].
    Before using this function, the socket must have been realized,
    and for hence, have been added to its parent.
    
    ## Obtaining the window ID of a socket.
    
    ```c
    GtkWidget *socket = gtk_socket_new ();
    gtk_widget_show (socket);
    gtk_container_add (GTK_CONTAINER (parent), socket);
    
    // The following call is only necessary if one of
    // the ancestors of the socket is not yet visible.
    gtk_widget_realize (socket);
    g_print ("The ID of the sockets window is %#x\n",
             gtk_socket_get_id (socket));
    ```
    
    Note that if you pass the window ID of the socket to another
    process that will create a plug in the socket, you must make
    sure that the socket widget is not destroyed until that plug
    is created. Violating this rule will cause unpredictable
    consequences, the most likely consequence being that the plug
    will appear as a separate toplevel window. You can check if
    the plug has been created by using [gtk.socket.Socket.getPlugWindow].
    If it returns a non-null value, then the plug has been
    successfully created inside of the socket.
    
    When GTK+ is notified that the embedded window has been destroyed,
    then it will destroy the socket as well. You should always,
    therefore, be prepared for your sockets to be destroyed at any
    time when the main event loop is running. To prevent this from
    happening, you can connect to the #GtkSocket::plug-removed signal.
    
    The communication between a #GtkSocket and a #GtkPlug follows the
    [XEmbed Protocol](http://www.freedesktop.org/Standards/xembed-spec).
    This protocol has also been implemented in other toolkits, e.g. Qt,
    allowing the same level of integration when embedding a Qt widget
    in GTK or vice versa.
    
    The #GtkPlug and #GtkSocket widgets are only available when GTK+
    is compiled for the X11 platform and `GDK_WINDOWING_X11` is defined.
    They can only be used on a #GdkX11Display. To use #GtkPlug and
    #GtkSocket, you need to include the `gtk/gtkx.h` header.
*/
class Socket : gtk.container.Container
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
    return cast(void function())gtk_socket_get_type != &gidSymbolNotFound ? gtk_socket_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Socket self()
  {
    return this;
  }

  /**
      Create a new empty #GtkSocket.
      Returns: the new #GtkSocket.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_socket_new();
    this(_cretval, No.Take);
  }

  /**
      Adds an XEMBED client, such as a #GtkPlug, to the #GtkSocket.  The
      client may be in the same process or in a different process.
      
      To embed a #GtkPlug in a #GtkSocket, you can either create the
      #GtkPlug with `gtk_plug_new (0)`, call
      [gtk.plug.Plug.getId] to get the window ID of the plug, and then pass that to the
      [gtk.socket.Socket.addId], or you can call [gtk.socket.Socket.getId] to get the
      window ID for the socket, and call [gtk.plug.Plug.new_] passing in that
      ID.
      
      The #GtkSocket must have already be added into a toplevel window
       before you can make this call.
  
      Params:
        window = the Window of a client participating in the XEMBED protocol.
  */
  void addId(xlib.types.Window window)
  {
    gtk_socket_add_id(cast(GtkSocket*)this._cPtr, window);
  }

  /**
      Gets the window ID of a #GtkSocket widget, which can then
      be used to create a client embedded inside the socket, for
      instance with [gtk.plug.Plug.new_].
      
      The #GtkSocket must have already be added into a toplevel window
      before you can make this call.
      Returns: the window ID for the socket
  */
  xlib.types.Window getId()
  {
    xlib.types.Window _retval;
    _retval = gtk_socket_get_id(cast(GtkSocket*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the window of the plug. Use this to check if the plug has
      been created inside of the socket.
      Returns: the window of the plug if
        available, or null
  */
  gdk.window.Window getPlugWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_socket_get_plug_window(cast(GtkSocket*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `PlugAdded` signal.
  
      This signal is emitted when a client is successfully
        added to the socket.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.socket.Socket socket))
  
          `socket` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPlugAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.socket.Socket)))
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
    return connectSignalClosure("plug-added", closure, after);
  }

  /**
      Connect to `PlugRemoved` signal.
  
      This signal is emitted when a client is removed from the socket.
        The default action is to destroy the #GtkSocket widget, so if you
        want to reuse it you must add a signal handler that returns true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.socket.Socket socket))
  
          `socket` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPlugRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.socket.Socket)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("plug-removed", closure, after);
  }
}
