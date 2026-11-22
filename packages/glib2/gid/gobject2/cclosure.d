/// Module for [CClosure] class
module gid.gobject2.cclosure;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.closure;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    A #GCClosure is a specialization of #GClosure for C function callbacks.
*/
class CClosure : StructWrap!(GCClosure)
{
  /**
      Create a `cclosure.CClosure` wrap type.
  */
  this() nothrow
  {
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
      Get `closure` field.
      Returns: the #GClosure
  */
  @property gid.gobject2.closure.Closure closure() nothrow
  {
    return cToD!(gid.gobject2.closure.Closure)(cast(void*)&(cast(GCClosure*)this._cPtr).closure);
  }

  /**
      A #GClosureMarshal function for use with signals with handlers that
      take two boxed pointers as arguments and return a boolean.  If you
      have such a signal, you will probably also need to use an
      accumulator, such as [gid.gobject2.global.signalAccumulatorTrueHandled].
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalBOOLEANBOXEDBOXED(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_BOOLEAN__BOXED_BOXED(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with handlers that
      take a flags type as an argument and return a boolean.  If you have
      such a signal, you will probably also need to use an accumulator,
      such as [gid.gobject2.global.signalAccumulatorTrueHandled].
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalBOOLEANFLAGS(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_BOOLEAN__FLAGS(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with handlers that
      take a #GObject and a pointer and produce a string.  It is highly
      unlikely that your signal handler fits this description.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalSTRINGOBJECTPOINTER(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_STRING__OBJECT_POINTER(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      boolean argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDBOOLEAN(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__BOOLEAN(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      argument which is any boxed pointer type.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDBOXED(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__BOXED(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      character argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDCHAR(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__CHAR(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with one
      double-precision floating point argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDDOUBLE(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__DOUBLE(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      argument with an enumerated type.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDENUM(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__ENUM(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      argument with a flags types.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDFLAGS(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__FLAGS(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with one
      single-precision floating point argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDFLOAT(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__FLOAT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      integer argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDINT(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__INT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with with a single
      long integer argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDLONG(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__LONG(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      #GObject argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDOBJECT(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__OBJECT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      argument of type #GParamSpec.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDPARAM(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__PARAM(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single raw
      pointer argument type.
      
      If it is possible, it is better to use one of the more specific
      functions such as g_cclosure_marshal_VOID__OBJECT() or
      g_cclosure_marshal_VOID__OBJECT().
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDPOINTER(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__POINTER(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single string
      argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDSTRING(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__STRING(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      unsigned character argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDUCHAR(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__UCHAR(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with with a single
      unsigned integer argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDUINT(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__UINT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with an unsigned int
      and a pointer as arguments.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDUINTPOINTER(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__UINT_POINTER(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      unsigned long integer argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDULONG(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__ULONG(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with a single
      #GVariant argument.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDVARIANT(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__VARIANT(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with no arguments.
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDVOID(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnValue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_VOID__VOID(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A generic marshaller function implemented via
      [libffi](http://sourceware.org/libffi/).
      
      Normally this function is not passed explicitly to [gid.gobject2.global.signalNew],
      but used automatically by GLib when specifying a null marshaller.
  
      Params:
        closure = A #GClosure.
        returnGvalue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gid.gobject2.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gid.gobject2.closure.Closure.setMarshal] and
            [gid.gobject2.closure.Closure.setMetaMarshal]
  */
  static void marshalGeneric(gid.gobject2.closure.Closure closure, gid.gobject2.value.Value returnGvalue, uint nParamValues, gid.gobject2.value.Value paramValues, void* invocationHint = null, void* marshalData = null) nothrow
  {
    g_cclosure_marshal_generic(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnGvalue ? cast(GValue*)returnGvalue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }
}
