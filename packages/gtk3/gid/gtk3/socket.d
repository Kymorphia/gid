/// Module for [Socket] class
module gid.gtk3.socket;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.window;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.types;
import gid.xlib2.types;

/**
    Together with #GtkPlug, #GtkSocket provides the ability to embed
    widgets from one process into another process in a fashion that
    is transparent to the user. One process creates a #GtkSocket widget
    and passes that widget’s window ID to the other process, which then
    creates a #GtkPlug with that window ID. Any widgets contained in the
    #GtkPlug then will appear inside the first application’s window.
    
    The socket’s window ID is obtained by using [gid.gtk3.socket.Socket.getId].
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
    the plug has been created by using [gid.gtk3.socket.Socket.getPlugWindow].
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
class Socket : gid.gtk3.container.Container
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_socket_get_type != &gidSymbolNotFound ? gtk_socket_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSocket";
  }

  /** Returns `this`, for use in `with` statements. */
  override Socket self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.socket.Socket]
      Returns: New builder object
  */
  static SocketGidBuilder builder() nothrow
  {
    return new SocketGidBuilder;
  }

  /**
      Create a new empty #GtkSocket.
      Returns: the new #GtkSocket.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_socket_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncPlugAdded()
  {
    auto _klass = cast(GtkSocketClass*)_vfuncClass;
    if (!_klass.plugAdded)
      return;

    _klass.plugAdded(cast(GtkSocket*)this._cPtr);
  }

  /** */
  protected bool vfuncPlugRemoved()
  {
    auto _klass = cast(GtkSocketClass*)_vfuncClass;
    if (!_klass.plugRemoved)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.plugRemoved(cast(GtkSocket*)this._cPtr);
    return _retval;
  }

  /**
      Adds an XEMBED client, such as a #GtkPlug, to the #GtkSocket.  The
      client may be in the same process or in a different process.
      
      To embed a #GtkPlug in a #GtkSocket, you can either create the
      #GtkPlug with `gtk_plug_new (0)`, call
      [gid.gtk3.plug.Plug.getId] to get the window ID of the plug, and then pass that to the
      [gid.gtk3.socket.Socket.addId], or you can call [gid.gtk3.socket.Socket.getId] to get the
      window ID for the socket, and call [gid.gtk3.plug.Plug.new_] passing in that
      ID.
      
      The #GtkSocket must have already be added into a toplevel window
       before you can make this call.
  
      Params:
        window = the Window of a client participating in the XEMBED protocol.
  */
  void addId(gid.xlib2.types.Window window) nothrow
  {
    gtk_socket_add_id(cast(GtkSocket*)this._cPtr, window);
  }

  /**
      Gets the window ID of a #GtkSocket widget, which can then
      be used to create a client embedded inside the socket, for
      instance with [gid.gtk3.plug.Plug.new_].
      
      The #GtkSocket must have already be added into a toplevel window
      before you can make this call.
      Returns: the window ID for the socket
  */
  gid.xlib2.types.Window getId() nothrow
  {
    gid.xlib2.types.Window _retval;
    _retval = gtk_socket_get_id(cast(GtkSocket*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the window of the plug. Use this to check if the plug has
      been created inside of the socket.
      Returns: the window of the plug if
        available, or null
  */
  gid.gdk3.window.Window getPlugWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_socket_get_plug_window(cast(GtkSocket*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `PlugAdded` signal.
  
      This signal is emitted when a client is successfully
        added to the socket.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.socket.Socket socket)`
  
          `socket` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPlugAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.socket.Socket)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.socket.Socket.plugAdded");
      }
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
  
          `bool callback(gid.gtk3.socket.Socket socket)`
  
          `socket` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPlugRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.socket.Socket)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.socket.Socket.plugRemoved");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("plug-removed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Socket
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.socket.Socket), T.stringof ~ " is not derived from gid.gtk3.socket.Socket");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPlugAdded", true)[0]) == gid.gtk3.socket.Socket))
      _installVfunc(klass, "plug_added");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPlugRemoved", true)[0]) == gid.gtk3.socket.Socket))
      _installVfunc(klass, "plug_removed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSocketClass*)klass;

    switch (vfunc)
    {
      case "plug_added":
      {
        static extern(C) void _vfuncPlugAddedTramp(GtkSocket* socket) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.socket.Socket)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)socket);
          if (!_obj)
          {
            auto _klass = cast(GtkSocketClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)socket);
            if (_klass.plugAdded)
              return (cast(typeof(&_vfuncPlugAddedTramp))_klass.plugAdded)(socket);
            return;
          }

          try
          {
            _obj.vfuncPlugAdded();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.socket.Socket.vfuncPlugAdded");
          }
        }

        _klass.plugAdded = cast(typeof(_klass.plugAdded))&_vfuncPlugAddedTramp;
        break;
      }
      case "plug_removed":
      {
        static extern(C) gboolean _vfuncPlugRemovedTramp(GtkSocket* socket) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.socket.Socket)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)socket);
          if (!_obj)
          {
            auto _klass = cast(GtkSocketClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)socket);
            if (_klass.plugRemoved)
              return (cast(typeof(&_vfuncPlugRemovedTramp))_klass.plugRemoved)(socket);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPlugRemoved();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.socket.Socket.vfuncPlugRemoved");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.plugRemoved = cast(typeof(_klass.plugRemoved))&_vfuncPlugRemovedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.socket.Socket]
class SocketGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.socket.Socket]
final class SocketGidBuilder : SocketGidBuilderImpl!SocketGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Socket build() nothrow
  {
    return new Socket(cast(void*)createGObject(Socket._getGType), Yes.Take);
  }
}
