/// Module for [ParamSpecFraction] class
module gst.param_spec_fraction;

public import gid.basictypes;
import gid.gid;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A GParamSpec derived structure that contains the meta data for fractional
    properties.
*/
class ParamSpecFraction
{
  GstParamSpecFraction _cInstance;

  /**
      Create a `param_spec_fraction.ParamSpecFraction` wrap type.
      Params:
        minNum = minimal numerator
        minDen = minimal denominator
        maxNum = maximal numerator
        maxDen = maximal denominator
        defNum = default numerator
        defDen = default denominator
  */
  this(int minNum = int.init, int minDen = int.init, int maxNum = int.init, int maxDen = int.init, int defNum = int.init, int defDen = int.init) nothrow
  {
    this.minNum = minNum;
    this.minDen = minDen;
    this.maxNum = maxNum;
    this.maxDen = maxDen;
    this.defNum = defNum;
    this.defDen = defDen;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstParamSpecFraction*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `parentInstance` field.
      Returns: super class
  */
  @property gobject.param_spec.ParamSpec parentInstance() nothrow
  {
    return cToD!(gobject.param_spec.ParamSpec)(cast(void*)&(cast(GstParamSpecFraction*)this._cPtr).parentInstance);
  }

  /**
      Get `minNum` field.
      Returns: minimal numerator
  */
  @property int minNum() nothrow
  {
    return (cast(GstParamSpecFraction*)this._cPtr).minNum;
  }

  /**
      Set `minNum` field.
      Params:
        propval = minimal numerator
  */
  @property void minNum(int propval) nothrow
  {
    (cast(GstParamSpecFraction*)this._cPtr).minNum = propval;
  }

  /**
      Get `minDen` field.
      Returns: minimal denominator
  */
  @property int minDen() nothrow
  {
    return (cast(GstParamSpecFraction*)this._cPtr).minDen;
  }

  /**
      Set `minDen` field.
      Params:
        propval = minimal denominator
  */
  @property void minDen(int propval) nothrow
  {
    (cast(GstParamSpecFraction*)this._cPtr).minDen = propval;
  }

  /**
      Get `maxNum` field.
      Returns: maximal numerator
  */
  @property int maxNum() nothrow
  {
    return (cast(GstParamSpecFraction*)this._cPtr).maxNum;
  }

  /**
      Set `maxNum` field.
      Params:
        propval = maximal numerator
  */
  @property void maxNum(int propval) nothrow
  {
    (cast(GstParamSpecFraction*)this._cPtr).maxNum = propval;
  }

  /**
      Get `maxDen` field.
      Returns: maximal denominator
  */
  @property int maxDen() nothrow
  {
    return (cast(GstParamSpecFraction*)this._cPtr).maxDen;
  }

  /**
      Set `maxDen` field.
      Params:
        propval = maximal denominator
  */
  @property void maxDen(int propval) nothrow
  {
    (cast(GstParamSpecFraction*)this._cPtr).maxDen = propval;
  }

  /**
      Get `defNum` field.
      Returns: default numerator
  */
  @property int defNum() nothrow
  {
    return (cast(GstParamSpecFraction*)this._cPtr).defNum;
  }

  /**
      Set `defNum` field.
      Params:
        propval = default numerator
  */
  @property void defNum(int propval) nothrow
  {
    (cast(GstParamSpecFraction*)this._cPtr).defNum = propval;
  }

  /**
      Get `defDen` field.
      Returns: default denominator
  */
  @property int defDen() nothrow
  {
    return (cast(GstParamSpecFraction*)this._cPtr).defDen;
  }

  /**
      Set `defDen` field.
      Params:
        propval = default denominator
  */
  @property void defDen(int propval) nothrow
  {
    (cast(GstParamSpecFraction*)this._cPtr).defDen = propval;
  }
}
