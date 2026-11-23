/// Module for [Socket] class
module gid.atk1.socket;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.component;
import gid.atk1.component_mixin;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Container for AtkPlug objects from other processes
    
    Together with #AtkPlug, #AtkSocket provides the ability to embed
    accessibles from one process into another in a fashion that is
    transparent to assistive technologies. #AtkSocket works as the
    container of #AtkPlug, embedding it using the method
    [gid.atk1.socket.Socket.embed]. Any accessible contained in the #AtkPlug will
    appear to the assistive technologies as being inside the
    application that created the #AtkSocket.
    
    The communication between a #AtkSocket and a #AtkPlug is done by
    the IPC layer of the accessibility framework, normally implemented
    by the D-Bus based implementation of AT-SPI (at-spi2). If that is
    the case, at-spi-atk2 is the responsible to implement the abstract
    methods [gid.atk1.plug.Plug.getId] and [gid.atk1.socket.Socket.embed], so an ATK
    implementor shouldn't reimplement them. The process that contains
    the #AtkPlug is responsible to send the ID returned by
    atk_plug_id() to the process that contains the #AtkSocket, so it
    could call the method [gid.atk1.socket.Socket.embed] in order to embed it.
    
    For the same reasons, an implementor doesn't need to implement
    [gid.atk1.object.ObjectWrap.getNAccessibleChildren] and
    [gid.atk1.object.ObjectWrap.refAccessibleChild]. All the logic related to those
    functions will be implemented by the IPC layer.
    
    See `class@AtkPlug`
*/
class Socket : gid.atk1.object.ObjectWrap, gid.atk1.component.Component
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
    return cast(void function())atk_socket_get_type != &gidSymbolNotFound ? atk_socket_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkSocket";
  }

  /** Returns `this`, for use in `with` statements. */
  override Socket self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.socket.Socket]
      Returns: New builder object
  */
  static SocketGidBuilder builder() nothrow
  {
    return new SocketGidBuilder;
  }

  mixin ComponentT!();

  /**
      Creates a new #AtkSocket.
      Returns: the newly created #AtkSocket instance
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      AtkObject* _cretval;
      _cretval = atk_socket_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Embeds the children of an #AtkPlug as the children of the
      #AtkSocket. The plug may be in the same process or in a different
      process.
      
      The class item used by this function should be filled in by the IPC
      layer (usually at-spi2-atk). The implementor of the AtkSocket
      should call this function and pass the id for the plug as returned
      by [gid.atk1.plug.Plug.getId].  It is the responsibility of the application
      to pass the plug id on to the process implementing the #AtkSocket
      as needed.
  
      Params:
        plugId = the ID of an #AtkPlug
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncEmbed` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncEmbed(string plugId)
  {
    auto _klass = cast(AtkSocketClass*)_vfuncClass;
    if (!_klass.embed)
      return;

    const(char)* _plugId = plugId.toCString!(No.Malloc, No.Nullable);
    _klass.embed(cast(AtkSocket*)this._cPtr, _plugId);
  }

  /**
      Embeds the children of an #AtkPlug as the children of the
      #AtkSocket. The plug may be in the same process or in a different
      process.
      
      The class item used by this function should be filled in by the IPC
      layer (usually at-spi2-atk). The implementor of the AtkSocket
      should call this function and pass the id for the plug as returned
      by [gid.atk1.plug.Plug.getId].  It is the responsibility of the application
      to pass the plug id on to the process implementing the #AtkSocket
      as needed.
  
      Params:
        plugId = the ID of an #AtkPlug
  */
  void embed(string plugId) nothrow
  {
    const(char)* _plugId = plugId.toCString!(No.Malloc, No.Nullable);
    atk_socket_embed(cast(AtkSocket*)this._cPtr, _plugId);
  }

  /**
      Determines whether or not the socket has an embedded plug.
      Returns: TRUE if a plug is embedded in the socket
  */
  bool isOccupied() nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_socket_is_occupied(cast(AtkSocket*)this._cPtr);
    return _retval;
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
    static assert(is(T : gid.atk1.socket.Socket), T.stringof ~ " is not derived from gid.atk1.socket.Socket");

    gid.atk1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEmbed", true)[0]) == gid.atk1.socket.Socket))
      _installVfunc(klass, "embed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(AtkSocketClass*)klass;

    switch (vfunc)
    {
      case "embed":
      {
        static extern(C) void _vfuncEmbedTramp(AtkSocket* obj, const(char)* plugId) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.socket.Socket)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)obj);
          if (!_obj)
          {
            auto _klass = cast(AtkSocketClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)obj);
            if (_klass.embed)
              return (cast(typeof(&_vfuncEmbedTramp))_klass.embed)(obj, plugId);
            return;
          }

          string _plugId = plugId.fromCString!(No.Free);

          try
          {
            _obj.vfuncEmbed(_plugId);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.socket.Socket.vfuncEmbed");
          }
        }

        _klass.embed = cast(typeof(_klass.embed))&_vfuncEmbedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.socket.Socket]
class SocketGidBuilderImpl(T) : gid.atk1.object.ObjectWrapGidBuilderImpl!T, gid.atk1.component.ComponentGidBuilderImpl!T
{

  mixin ComponentGidBuilderT!();
}

/// Fluent builder for [gid.atk1.socket.Socket]
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
