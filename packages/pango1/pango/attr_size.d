/// Module for [AttrSize] class
module pango.attr_size;

public import gid.basictypes;
import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_size.AttrSize] structure is used to represent attributes which
    set font size.
*/
class AttrSize
{
  PangoAttrSize _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoAttrSize*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr() nothrow
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrSize*)this._cPtr).attr);
  }

  /**
      Get `size` field.
      Returns: size of font, in units of 1/[pango.types.SCALE] of a point (for
          [pango.types.AttrType.Size]) or of a device unit (for [pango.types.AttrType.AbsoluteSize])
  */
  @property int size() nothrow
  {
    return (cast(PangoAttrSize*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = size of font, in units of 1/[pango.types.SCALE] of a point (for
            [pango.types.AttrType.Size]) or of a device unit (for [pango.types.AttrType.AbsoluteSize])
  */
  @property void size(int propval) nothrow
  {
    (cast(PangoAttrSize*)this._cPtr).size = propval;
  }

  /**
      Get `absolute` field.
      Returns: whether the font size is in device units or points.
          This field is only present for compatibility with Pango-1.8.0
          ([pango.types.AttrType.AbsoluteSize] was added in 1.8.1); and always will
          be false for [pango.types.AttrType.Size] and true for [pango.types.AttrType.AbsoluteSize].
  */
  @property uint absolute() nothrow
  {
    return (cast(PangoAttrSize*)this._cPtr).absolute;
  }

  /**
      Set `absolute` field.
      Params:
        propval = whether the font size is in device units or points.
            This field is only present for compatibility with Pango-1.8.0
            ([pango.types.AttrType.AbsoluteSize] was added in 1.8.1); and always will
            be false for [pango.types.AttrType.Size] and true for [pango.types.AttrType.AbsoluteSize].
  */
  @property void absolute(uint propval) nothrow
  {
    (cast(PangoAttrSize*)this._cPtr).absolute = propval;
  }

  /**
      Create a new font-size attribute in fractional points.
  
      Params:
        size = the font size, in [pango.types.SCALE]-ths of a point
      Returns: the newly allocated
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(int size) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_size_new(size);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new font-size attribute in device units.
  
      Params:
        size = the font size, in [pango.types.SCALE]-ths of a device unit
      Returns: the newly allocated
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute newAbsolute(int size) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_size_new_absolute(size);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
