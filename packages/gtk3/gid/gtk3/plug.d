/// Module for [Plug] class
module gid.gtk3.plug;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.display;
import gid.gdk3.window;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window;
import gid.xlib2.types;

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
class Plug : gid.gtk3.window.Window
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_plug_get_type != &gidSymbolNotFound ? gtk_plug_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPlug";
  }

  /** Returns `this`, for use in `with` statements. */
  override Plug self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.plug.Plug]
      Returns: New builder object
  */
  static PlugGidBuilder builder() nothrow
  {
    return new PlugGidBuilder;
  }

  /**
      Get `embedded` property.
      Returns: true if the plug is embedded in a socket.
  */
  @property bool embedded() nothrow
  {
    return getEmbedded();
  }

  /**
      Get `socketWindow` property.
      Returns: The window of the socket the plug is embedded in.
  */
  @property gid.gdk3.window.Window socketWindow() nothrow
  {
    return getSocketWindow();
  }

  /**
      Creates a new plug widget inside the #GtkSocket identified
      by socket_id. If socket_id is 0, the plug is left “unplugged” and
      can later be plugged into a #GtkSocket by  [gid.gtk3.socket.Socket.addId].
  
      Params:
        socketId = the window ID of the socket, or 0.
      Returns: the new #GtkPlug widget.
  */
  this(gid.xlib2.types.Window socketId) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_plug_new(socketId);
      this(_cretval, No.Take);
    }
  }

  /**
      Create a new plug widget inside the #GtkSocket identified by socket_id.
  
      Params:
        display = the #GdkDisplay on which socket_id is displayed
        socketId = the XID of the socket’s window.
      Returns: the new #GtkPlug widget.
  */
  static gid.gtk3.plug.Plug newForDisplay(gid.gdk3.display.Display display, gid.xlib2.types.Window socketId) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_plug_new_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, socketId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.plug.Plug)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncEmbedded()
  {
    auto _klass = cast(GtkPlugClass*)_vfuncClass;
    if (!_klass.embedded)
      return;

    _klass.embedded(cast(GtkPlug*)this._cPtr);
  }

  /**
      Finish the initialization of plug for a given #GtkSocket identified by
      socket_id. This function will generally only be used by classes deriving from #GtkPlug.
  
      Params:
        socketId = the XID of the socket’s window.
  */
  void construct(gid.xlib2.types.Window socketId) nothrow
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
  void constructForDisplay(gid.gdk3.display.Display display, gid.xlib2.types.Window socketId) nothrow
  {
    gtk_plug_construct_for_display(cast(GtkPlug*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, socketId);
  }

  /**
      Determines whether the plug is embedded in a socket.
      Returns: true if the plug is embedded in a socket
  */
  bool getEmbedded() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_plug_get_embedded(cast(GtkPlug*)this._cPtr);
    return _retval;
  }

  /**
      Gets the window ID of a #GtkPlug widget, which can then
      be used to embed this window inside another window, for
      instance with [gid.gtk3.socket.Socket.addId].
      Returns: the window ID for the plug
  */
  gid.xlib2.types.Window getId() nothrow
  {
    gid.xlib2.types.Window _retval;
    _retval = gtk_plug_get_id(cast(GtkPlug*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the socket the plug is embedded in.
      Returns: the window of the socket, or null
  */
  gid.gdk3.window.Window getSocketWindow() nothrow
  {
    GdkWindow* _cretval;
    _cretval = gtk_plug_get_socket_window(cast(GtkPlug*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `Embedded` signal.
  
      Gets emitted when the plug becomes embedded in a socket.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.plug.Plug plug)`
  
          `plug` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEmbedded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.plug.Plug)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.plug.Plug.embedded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("embedded", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Plug
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.plug.Plug), T.stringof ~ " is not derived from gid.gtk3.plug.Plug");

    gid.gtk3.window.Window._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEmbedded", true)[0]) == gid.gtk3.plug.Plug))
      _installVfunc(klass, "embedded");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkPlugClass*)klass;

    switch (vfunc)
    {
      case "embedded":
      {
        static extern(C) void _vfuncEmbeddedTramp(GtkPlug* plug) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.plug.Plug)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)plug);
          if (!_obj)
          {
            auto _klass = cast(GtkPlugClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)plug);
            if (_klass.embedded)
              return (cast(typeof(&_vfuncEmbeddedTramp))_klass.embedded)(plug);
            return;
          }

          try
          {
            _obj.vfuncEmbedded();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.plug.Plug.vfuncEmbedded");
          }
        }

        _klass.embedded = cast(typeof(_klass.embedded))&_vfuncEmbeddedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.plug.Plug]
class PlugGidBuilderImpl(T) : gid.gtk3.window.WindowGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.plug.Plug]
final class PlugGidBuilder : PlugGidBuilderImpl!PlugGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Plug build() nothrow
  {
    return new Plug(cast(void*)createGObject(Plug._getGType), Yes.Take);
  }
}
