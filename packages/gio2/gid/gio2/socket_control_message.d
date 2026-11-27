/// Module for [SocketControlMessage] class
module gid.gio2.socket_control_message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.socket_control_message.SocketControlMessage] is a special-purpose utility message that
    can be sent to or received from a [gid.gio2.socket.Socket]. These types of
    messages are often called ‘ancillary data’.
    
    The message can represent some sort of special instruction to or
    information from the socket or can represent a special kind of
    transfer to the peer (for example, sending a file descriptor over
    a UNIX socket).
    
    These messages are sent with [gid.gio2.socket.Socket.sendMessage] and received
    with [gid.gio2.socket.Socket.receiveMessage].
    
    To extend the set of control messages that can be sent, subclass this
    class and override the `get_size`, `get_level`, `get_type` and `serialize`
    methods.
    
    To extend the set of control messages that can be received, subclass
    this class and implement the `deserialize` method. Also, make sure your
    class is registered with the [gid.gobject2.types.size_t] type system before calling
    [gid.gio2.socket.Socket.receiveMessage] to read such a message.
*/
@gidGir("SocketControlMessage", "SocketControlMessageClass")
class SocketControlMessage : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_socket_control_message_get_type != &gidSymbolNotFound ? g_socket_control_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSocketControlMessage";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketControlMessage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.socket_control_message.SocketControlMessage]
      Returns: New builder object
  */
  static SocketControlMessageGidBuilder builder() nothrow
  {
    return new SocketControlMessageGidBuilder;
  }

  /**
      Tries to deserialize a socket control message of a given
      level and type. This will ask all known (to GType) subclasses
      of #GSocketControlMessage if they can understand this kind
      of message and if so deserialize it into a #GSocketControlMessage.
      
      If there is no implementation for this kind of control message, null
      will be returned.
  
      Params:
        level = a socket level
        type = a socket control message type for the given level
        data = pointer to the message data
      Returns: the deserialized message or null
  */
  static gid.gio2.socket_control_message.SocketControlMessage deserialize(int level, int type, ubyte[] data) nothrow
  {
    GSocketControlMessage* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = g_socket_control_message_deserialize(level, type, _size, _data);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_control_message.SocketControlMessage)(cast(GSocketControlMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the "level" (i.e. the originating protocol) of the control message.
      This is often SOL_SOCKET.
      Returns: an integer describing the level
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetLevel` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncGetLevel()
  {
    auto _klass = cast(GSocketControlMessageClass*)_vfuncClass;
    if (!_klass.getLevel)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getLevel(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the space required for the control message, not including
      headers or alignment.
      Returns: The number of bytes required.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected size_t vfuncGetSize()
  {
    auto _klass = cast(GSocketControlMessageClass*)_vfuncClass;
    if (!_klass.getSize)
      return typeof(return).init;

    size_t _retval;
    _retval = _klass.getSize(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      gets the protocol specific type of the message.
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetType` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncGetType()
  {
    auto _klass = cast(GSocketControlMessageClass*)_vfuncClass;
    if (!_klass.getType)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getType(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Converts the data in the message to bytes placed in the
      message.
      
      data is guaranteed to have enough space to fit the size
      returned by [gid.gio2.socket_control_message.SocketControlMessage.getSize] on this
      object.
  
      Params:
        data = A buffer to write data to
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSerialize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSerialize(void* data)
  {
    auto _klass = cast(GSocketControlMessageClass*)_vfuncClass;
    if (!_klass.serialize)
      return;

    _klass.serialize(cast(GSocketControlMessage*)this._cPtr, data);
  }

  /**
      Returns the "level" (i.e. the originating protocol) of the control message.
      This is often SOL_SOCKET.
      Returns: an integer describing the level
  */
  int getLevel() nothrow
  {
    int _retval;
    _retval = g_socket_control_message_get_level(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the protocol specific type of the control message.
      For instance, for UNIX fd passing this would be SCM_RIGHTS.
      Returns: an integer describing the type of control message
  */
  int getMsgType() nothrow
  {
    int _retval;
    _retval = g_socket_control_message_get_msg_type(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Returns the space required for the control message, not including
      headers or alignment.
      Returns: The number of bytes required.
  */
  size_t getSize() nothrow
  {
    size_t _retval;
    _retval = g_socket_control_message_get_size(cast(GSocketControlMessage*)this._cPtr);
    return _retval;
  }

  /**
      Converts the data in the message to bytes placed in the
      message.
      
      data is guaranteed to have enough space to fit the size
      returned by [gid.gio2.socket_control_message.SocketControlMessage.getSize] on this
      object.
  
      Params:
        data = A buffer to write data to
  */
  void serialize(void* data) nothrow
  {
    g_socket_control_message_serialize(cast(GSocketControlMessage*)this._cPtr, data);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from SocketControlMessage
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.socket_control_message.SocketControlMessage), T.stringof ~ " is not derived from gid.gio2.socket_control_message.SocketControlMessage");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetLevel", true)[0]) == gid.gio2.socket_control_message.SocketControlMessage))
      _installVfunc(klass, "get_level");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSize", true)[0]) == gid.gio2.socket_control_message.SocketControlMessage))
      _installVfunc(klass, "get_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetType", true)[0]) == gid.gio2.socket_control_message.SocketControlMessage))
      _installVfunc(klass, "get_type");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSerialize", true)[0]) == gid.gio2.socket_control_message.SocketControlMessage))
      _installVfunc(klass, "serialize");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GSocketControlMessageClass*)klass;

    switch (vfunc)
    {
      case "get_level":
      {
        static extern(C) int _vfuncGetLevelTramp(GSocketControlMessage* message) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.socket_control_message.SocketControlMessage)(cast(void*)message);
          if (!_obj)
          {
            auto _klass = cast(GSocketControlMessageClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)message);
            if (_klass.getLevel)
              return (cast(typeof(&_vfuncGetLevelTramp))_klass.getLevel)(message);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetLevel();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_control_message.SocketControlMessage.vfuncGetLevel");
          }
          return _retval;
        }

        _klass.getLevel = cast(typeof(_klass.getLevel))&_vfuncGetLevelTramp;
        break;
      }
      case "get_size":
      {
        static extern(C) size_t _vfuncGetSizeTramp(GSocketControlMessage* message) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.socket_control_message.SocketControlMessage)(cast(void*)message);
          if (!_obj)
          {
            auto _klass = cast(GSocketControlMessageClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)message);
            if (_klass.getSize)
              return (cast(typeof(&_vfuncGetSizeTramp))_klass.getSize)(message);
            return typeof(return).init;
          }

          size_t _retval;

          try
          {
            _retval = _obj.vfuncGetSize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_control_message.SocketControlMessage.vfuncGetSize");
          }
          return _retval;
        }

        _klass.getSize = cast(typeof(_klass.getSize))&_vfuncGetSizeTramp;
        break;
      }
      case "get_type":
      {
        static extern(C) int _vfuncGetTypeTramp(GSocketControlMessage* message) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.socket_control_message.SocketControlMessage)(cast(void*)message);
          if (!_obj)
          {
            auto _klass = cast(GSocketControlMessageClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)message);
            if (_klass.getType)
              return (cast(typeof(&_vfuncGetTypeTramp))_klass.getType)(message);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetType();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_control_message.SocketControlMessage.vfuncGetType");
          }
          return _retval;
        }

        _klass.getType = cast(typeof(_klass.getType))&_vfuncGetTypeTramp;
        break;
      }
      case "serialize":
      {
        static extern(C) void _vfuncSerializeTramp(GSocketControlMessage* message, void* data) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.socket_control_message.SocketControlMessage)(cast(void*)message);
          if (!_obj)
          {
            auto _klass = cast(GSocketControlMessageClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)message);
            if (_klass.serialize)
              return (cast(typeof(&_vfuncSerializeTramp))_klass.serialize)(message, data);
            return;
          }

          try
          {
            _obj.vfuncSerialize(data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_control_message.SocketControlMessage.vfuncSerialize");
          }
        }

        _klass.serialize = cast(typeof(_klass.serialize))&_vfuncSerializeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_control_message.SocketControlMessage]
class SocketControlMessageGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.socket_control_message.SocketControlMessage]
final class SocketControlMessageGidBuilder : SocketControlMessageGidBuilderImpl!SocketControlMessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketControlMessage build() nothrow
  {
    return new SocketControlMessage(cast(void*)createGObject(SocketControlMessage._getGType), Yes.Take);
  }
}
