/// Module for [Socket] class
module atk.socket;

import atk.c.functions;
import atk.c.types;
import atk.component;
import atk.component_mixin;
import atk.object;
import atk.types;
import gid.gid;

/**
    Container for AtkPlug objects from other processes
    
    Together with #AtkPlug, #AtkSocket provides the ability to embed
    accessibles from one process into another in a fashion that is
    transparent to assistive technologies. #AtkSocket works as the
    container of #AtkPlug, embedding it using the method
    [atk.socket.Socket.embed]. Any accessible contained in the #AtkPlug will
    appear to the assistive technologies as being inside the
    application that created the #AtkSocket.
    
    The communication between a #AtkSocket and a #AtkPlug is done by
    the IPC layer of the accessibility framework, normally implemented
    by the D-Bus based implementation of AT-SPI (at-spi2). If that is
    the case, at-spi-atk2 is the responsible to implement the abstract
    methods [atk.plug.Plug.getId] and [atk.socket.Socket.embed], so an ATK
    implementor shouldn't reimplement them. The process that contains
    the #AtkPlug is responsible to send the ID returned by
    atk_plug_id() to the process that contains the #AtkSocket, so it
    could call the method [atk.socket.Socket.embed] in order to embed it.
    
    For the same reasons, an implementor doesn't need to implement
    [atk.object.ObjectWrap.getNAccessibleChildren] and
    [atk.object.ObjectWrap.refAccessibleChild]. All the logic related to those
    functions will be implemented by the IPC layer.
    
    See `class@AtkPlug`
*/
class Socket : atk.object.ObjectWrap, atk.component.Component
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
    return cast(void function())atk_socket_get_type != &gidSymbolNotFound ? atk_socket_get_type() : cast(GType)0;
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

  mixin ComponentT!();

  /**
      Creates a new #AtkSocket.
      Returns: the newly created #AtkSocket instance
  */
  this()
  {
    AtkObject* _cretval;
    _cretval = atk_socket_new();
    this(_cretval, Yes.Take);
  }

  /**
      Embeds the children of an #AtkPlug as the children of the
      #AtkSocket. The plug may be in the same process or in a different
      process.
      
      The class item used by this function should be filled in by the IPC
      layer (usually at-spi2-atk). The implementor of the AtkSocket
      should call this function and pass the id for the plug as returned
      by [atk.plug.Plug.getId].  It is the responsibility of the application
      to pass the plug id on to the process implementing the #AtkSocket
      as needed.
  
      Params:
        plugId = the ID of an #AtkPlug
  */
  void embed(string plugId)
  {
    const(char)* _plugId = plugId.toCString(No.Alloc);
    atk_socket_embed(cast(AtkSocket*)this._cPtr, _plugId);
  }

  /**
      Determines whether or not the socket has an embedded plug.
      Returns: TRUE if a plug is embedded in the socket
  */
  bool isOccupied()
  {
    bool _retval;
    _retval = cast(bool)atk_socket_is_occupied(cast(AtkSocket*)this._cPtr);
    return _retval;
  }
}
