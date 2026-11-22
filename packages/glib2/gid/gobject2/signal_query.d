/// Module for [SignalQuery] class
module gid.gobject2.signal_query;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.types;

/**
    A structure holding in-depth information for a specific signal.
    
    See also: [gid.gobject2.global.signalQuery]
*/
class SignalQuery : StructWrap!(GSignalQuery)
{
  /**
      Create a `signal_query.SignalQuery` wrap type.
      Params:
        signalId = The signal id of the signal being queried, or 0 if the
           signal to be queried was unknown.
        signalName = The signal name.
        itype = The interface/instance type that this signal can be emitted for.
        signalFlags = The signal flags as passed in to [gid.gobject2.global.signalNew].
        returnType = The return type for user callbacks.
  */
  this(uint signalId = uint.init, string signalName = string.init, gid.gobject2.types.GType itype = gid.gobject2.types.GType.init, gid.gobject2.types.SignalFlags signalFlags = gid.gobject2.types.SignalFlags.init, gid.gobject2.types.GType returnType = gid.gobject2.types.GType.init) nothrow
  {
    this.signalId = signalId;
    this.signalName = signalName;
    this.itype = itype;
    this.signalFlags = signalFlags;
    this.returnType = returnType;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `signalId` field.
      Returns: The signal id of the signal being queried, or 0 if the
         signal to be queried was unknown.
  */
  @property uint signalId() nothrow
  {
    return (cast(GSignalQuery*)this._cPtr).signalId;
  }

  /**
      Set `signalId` field.
      Params:
        propval = The signal id of the signal being queried, or 0 if the
           signal to be queried was unknown.
  */
  @property void signalId(uint propval) nothrow
  {
    (cast(GSignalQuery*)this._cPtr).signalId = propval;
  }

  private const(char)* _signalNameRef; // Keeps borrowed GC string alive

  /**
      Get `signalName` field.
      Returns: The signal name.
  */
  @property string signalName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GSignalQuery*)this._cPtr).signalName);
  }

  /**
      Set `signalName` field.
      Params:
        propval = The signal name.
  */
  @property void signalName(string propval) nothrow
  {
    if (_refuseBorrowedStore("signalName"))
      return;

    _signalNameRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(GSignalQuery*)this._cPtr).signalName = cast(const(char)*)_signalNameRef;
  }

  /**
      Get `itype` field.
      Returns: The interface/instance type that this signal can be emitted for.
  */
  @property gid.gobject2.types.GType itype() nothrow
  {
    return (cast(GSignalQuery*)this._cPtr).itype;
  }

  /**
      Set `itype` field.
      Params:
        propval = The interface/instance type that this signal can be emitted for.
  */
  @property void itype(gid.gobject2.types.GType propval) nothrow
  {
    (cast(GSignalQuery*)this._cPtr).itype = propval;
  }

  /**
      Get `signalFlags` field.
      Returns: The signal flags as passed in to [gid.gobject2.global.signalNew].
  */
  @property gid.gobject2.types.SignalFlags signalFlags() nothrow
  {
    return cast(gid.gobject2.types.SignalFlags)(cast(GSignalQuery*)this._cPtr).signalFlags;
  }

  /**
      Set `signalFlags` field.
      Params:
        propval = The signal flags as passed in to [gid.gobject2.global.signalNew].
  */
  @property void signalFlags(gid.gobject2.types.SignalFlags propval) nothrow
  {
    (cast(GSignalQuery*)this._cPtr).signalFlags = cast(GSignalFlags)propval;
  }

  /**
      Get `returnType` field.
      Returns: The return type for user callbacks.
  */
  @property gid.gobject2.types.GType returnType() nothrow
  {
    return (cast(GSignalQuery*)this._cPtr).returnType;
  }

  /**
      Set `returnType` field.
      Params:
        propval = The return type for user callbacks.
  */
  @property void returnType(gid.gobject2.types.GType propval) nothrow
  {
    (cast(GSignalQuery*)this._cPtr).returnType = propval;
  }

  /**
      Get `paramTypes` field.
      Returns: The individual parameter types for
         user callbacks, note that the effective callback signature is:
         ```c
         @return_type callback (#gpointer     data1,
         [param_types param_names,]
         gpointer     data2);
         ```
  */
  @property gid.gobject2.types.GType[] paramTypes() nothrow
  {
    if (!(cast(GSignalQuery*)this._cPtr).paramTypes)
      return null;

    return (cast(GSignalQuery*)this._cPtr).paramTypes[0 .. (cast(GSignalQuery*)this._cPtr).nParams].dup;
  }
}
