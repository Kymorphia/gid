/// Module for [ObjectConstructParam] class
module gid.gobject2.object_construct_param;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.c.functions;
import gid.gobject2.c.types;
import gid.gobject2.param_spec;
import gid.gobject2.types;
import gid.gobject2.value;

/**
    The GObjectConstructParam struct is an auxiliary structure used to hand
    #GParamSpec/#GValue pairs to the @constructor of a #GObjectClass.
*/
@gidGir("ObjectConstructParam")
class ObjectConstructParam : StructWrap!(GObjectConstructParam)
{
  /**
      Create a `object_construct_param.ObjectConstructParam` wrap type.
      Params:
        pspec = the #GParamSpec of the construct parameter
        value = the value to set the parameter to
  */
  this(gid.gobject2.param_spec.ParamSpec pspec = gid.gobject2.param_spec.ParamSpec.init, gid.gobject2.value.Value value = gid.gobject2.value.Value.init) nothrow
  {
    this.pspec = pspec;
    this.value = value;
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

  private gid.gobject2.param_spec.ParamSpec _pspecRef; // Keeps borrowed field value alive

  /**
      Get `pspec` field.
      Returns: the #GParamSpec of the construct parameter
  */
  @property gid.gobject2.param_spec.ParamSpec pspec() nothrow
  {
    return cToD!(gid.gobject2.param_spec.ParamSpec)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).pspec);
  }

  /**
      Set `pspec` field.
      Params:
        propval = the #GParamSpec of the construct parameter
  */
  @property void pspec(gid.gobject2.param_spec.ParamSpec propval) nothrow
  {
    if (_refuseBorrowedStore("pspec"))
      return;

    _pspecRef = propval;
    (cast(GObjectConstructParam*)this._cPtr).pspec = propval ? cast(GParamSpec*)propval._cPtr(No.Dup) : null;
  }

  private gid.gobject2.value.Value _valueRef; // Keeps borrowed field value alive

  /**
      Get `value` field.
      Returns: the value to set the parameter to
  */
  @property gid.gobject2.value.Value value() nothrow
  {
    return cToD!(gid.gobject2.value.Value)(cast(void*)(cast(GObjectConstructParam*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the value to set the parameter to
  */
  @property void value(gid.gobject2.value.Value propval) nothrow
  {
    if (_refuseBorrowedStore("value"))
      return;

    _valueRef = propval;
    (cast(GObjectConstructParam*)this._cPtr).value = propval ? cast(GValue*)propval._cPtr(No.Dup) : null;
  }
}
