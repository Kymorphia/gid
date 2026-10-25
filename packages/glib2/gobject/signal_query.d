/// Module for [SignalQuery] class
module gobject.signal_query;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;

/**
    A structure holding in-depth information for a specific signal.
    
    See also: [gobject.global.signalQuery]
*/
class SignalQuery
{
  GSignalQuery _cInstance;

  /**
      Create a `signal_query.SignalQuery` wrap type.
      Params:
        signalId = The signal id of the signal being queried, or 0 if the
           signal to be queried was unknown.
        signalName = The signal name.
        itype = The interface/instance type that this signal can be emitted for.
        signalFlags = The signal flags as passed in to [gobject.global.signalNew].
        returnType = The return type for user callbacks.
  */
  this(uint signalId = uint.init, string signalName = string.init, gobject.types.GType itype = gobject.types.GType.init, gobject.types.SignalFlags signalFlags = gobject.types.SignalFlags.init, gobject.types.GType returnType = gobject.types.GType.init) nothrow
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
    _cInstance = *cast(GSignalQuery*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
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
    cValueFree!(string)(cast(void*)(cast(GSignalQuery*)this._cPtr).signalName);
    dToC(propval, cast(void*)&(cast(GSignalQuery*)this._cPtr).signalName);
  }

  /**
      Get `itype` field.
      Returns: The interface/instance type that this signal can be emitted for.
  */
  @property gobject.types.GType itype() nothrow
  {
    return (cast(GSignalQuery*)this._cPtr).itype;
  }

  /**
      Set `itype` field.
      Params:
        propval = The interface/instance type that this signal can be emitted for.
  */
  @property void itype(gobject.types.GType propval) nothrow
  {
    (cast(GSignalQuery*)this._cPtr).itype = propval;
  }

  /**
      Get `signalFlags` field.
      Returns: The signal flags as passed in to [gobject.global.signalNew].
  */
  @property gobject.types.SignalFlags signalFlags() nothrow
  {
    return cast(gobject.types.SignalFlags)(cast(GSignalQuery*)this._cPtr).signalFlags;
  }

  /**
      Set `signalFlags` field.
      Params:
        propval = The signal flags as passed in to [gobject.global.signalNew].
  */
  @property void signalFlags(gobject.types.SignalFlags propval) nothrow
  {
    (cast(GSignalQuery*)this._cPtr).signalFlags = cast(GSignalFlags)propval;
  }

  /**
      Get `returnType` field.
      Returns: The return type for user callbacks.
  */
  @property gobject.types.GType returnType() nothrow
  {
    return (cast(GSignalQuery*)this._cPtr).returnType;
  }

  /**
      Set `returnType` field.
      Params:
        propval = The return type for user callbacks.
  */
  @property void returnType(gobject.types.GType propval) nothrow
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
  @property gobject.types.GType[] paramTypes() nothrow
  {
    return (cast(GSignalQuery*)this._cPtr).paramTypes[0 .. (cast(GSignalQuery*)this._cPtr).nParams].dup;
  }
}
