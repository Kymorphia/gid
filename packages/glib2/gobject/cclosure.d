/// Module for [CClosure] class
module gobject.cclosure;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.closure;
import gobject.types;
import gobject.value;

/**
    A #GCClosure is a specialization of #GClosure for C function callbacks.
*/
class CClosure
{
  GCClosure _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.cclosure.CClosure");

    _cInstance = *cast(GCClosure*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `closure` field.
      Returns: the #GClosure
  */
  @property gobject.closure.Closure closure()
  {
    return cToD!(gobject.closure.Closure)(cast(void*)&(cast(GCClosure*)this._cPtr).closure);
  }

  /**
      A #GClosureMarshal function for use with signals with handlers that
      take two boxed pointers as arguments and return a boolean.  If you
      have such a signal, you will probably also need to use an
      accumulator, such as [gobject.global.signalAccumulatorTrueHandled].
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalBOOLEANBOXEDBOXED(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
  {
    g_cclosure_marshal_BOOLEAN__BOXED_BOXED(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A #GClosureMarshal function for use with signals with handlers that
      take a flags type as an argument and return a boolean.  If you have
      such a signal, you will probably also need to use an accumulator,
      such as [gobject.global.signalAccumulatorTrueHandled].
  
      Params:
        closure = A #GClosure.
        returnValue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalBOOLEANFLAGS(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalSTRINGOBJECTPOINTER(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDBOOLEAN(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDBOXED(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDCHAR(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDDOUBLE(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDENUM(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDFLAGS(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDFLOAT(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDINT(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDLONG(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDOBJECT(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDPARAM(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDPOINTER(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDSTRING(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDUCHAR(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDUINT(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDUINTPOINTER(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDULONG(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDVARIANT(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
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
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalVOIDVOID(gobject.closure.Closure closure, gobject.value.Value returnValue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
  {
    g_cclosure_marshal_VOID__VOID(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnValue ? cast(GValue*)returnValue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }

  /**
      A generic marshaller function implemented via
      [libffi](http://sourceware.org/libffi/).
      
      Normally this function is not passed explicitly to [gobject.global.signalNew],
      but used automatically by GLib when specifying a null marshaller.
  
      Params:
        closure = A #GClosure.
        returnGvalue = A #GValue to store the return value. May be null
            if the callback of closure doesn't return a value.
        nParamValues = The length of the param_values array.
        paramValues = An array of #GValues holding the arguments
            on which to invoke the callback of closure.
        invocationHint = The invocation hint given as the last argument to
            [gobject.closure.Closure.invoke].
        marshalData = Additional data specified when registering the
            marshaller, see [gobject.closure.Closure.setMarshal] and
            [gobject.closure.Closure.setMetaMarshal]
  */
  static void marshalGeneric(gobject.closure.Closure closure, gobject.value.Value returnGvalue, uint nParamValues, gobject.value.Value paramValues, void* invocationHint = null, void* marshalData = null)
  {
    g_cclosure_marshal_generic(closure ? cast(GClosure*)closure._cPtr(No.Dup) : null, returnGvalue ? cast(GValue*)returnGvalue._cPtr(No.Dup) : null, nParamValues, paramValues ? cast(const(GValue)*)paramValues._cPtr(No.Dup) : null, invocationHint, marshalData);
  }
}
