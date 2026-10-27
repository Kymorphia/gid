/// Module for [ObjectConstructParam] class
module gobject.object_construct_param;

public import gid.basictypes;
import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.param_spec;
import gobject.types;
import gobject.value;

/**
    The GObjectConstructParam struct is an auxiliary structure used to hand
    #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
*/
class ObjectConstructParam
{
  GObjectConstructParam _cInstance;

  /**
      Create a `object_construct_param.ObjectConstructParam` wrap type.
      Params:
        pspec = the #GParamSpec of the construct parameter
        value = the value to set the parameter to
  */
  this(gobject.param_spec.ParamSpec pspec = gobject.param_spec.ParamSpec.init, gobject.value.Value value = gobject.value.Value.init) nothrow
  {
    this.pspec = pspec;
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GObjectConstructParam*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  private gobject.param_spec.ParamSpec _pspecRef; // Keeps borrowed field value alive

  /**
      Get `pspec` field.
      Returns: the #GParamSpec of the construct parameter
  */
  @property gobject.param_spec.ParamSpec pspec() nothrow
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).pspec);
  }

  /**
      Set `pspec` field.
      Params:
        propval = the #GParamSpec of the construct parameter
  */
  @property void pspec(gobject.param_spec.ParamSpec propval) nothrow
  {
    _pspecRef = propval;
    (cast(GObjectConstructParam*)this._cPtr).pspec = propval ? cast(GParamSpec*)propval._cPtr(No.Dup) : null;
  }

  private gobject.value.Value _valueRef; // Keeps borrowed field value alive

  /**
      Get `value` field.
      Returns: the value to set the parameter to
  */
  @property gobject.value.Value value() nothrow
  {
    return cToD!(gobject.value.Value)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the value to set the parameter to
  */
  @property void value(gobject.value.Value propval) nothrow
  {
    _valueRef = propval;
    (cast(GObjectConstructParam*)this._cPtr).value = propval ? cast(GValue*)propval._cPtr(No.Dup) : null;
  }
}
