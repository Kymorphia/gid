/// Module for [AttrSize] class
module gid.pango1.attr_size;

public import gid.core.basictypes;
import gid.core.utils;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/**
    The [gid.pango1.attr_size.AttrSize] structure is used to represent attributes which
    set font size.
*/
@gidGir("AttrSize")
class AttrSize : StructWrap!(PangoAttrSize)
{
  /**
      Create a `attr_size.AttrSize` wrap type.
      Params:
        size = size of font, in units of 1/[gid.pango1.types.SCALE] of a point (for
            [gid.pango1.types.AttrType.Size]) or of a device unit (for [gid.pango1.types.AttrType.AbsoluteSize])
        absolute = whether the font size is in device units or points.
            This field is only present for compatibility with Pango-1.8.0
            ([gid.pango1.types.AttrType.AbsoluteSize] was added in 1.8.1); and always will
            be false for [gid.pango1.types.AttrType.Size] and true for [gid.pango1.types.AttrType.AbsoluteSize].
  */
  this(int size = int.init, uint absolute = uint.init) nothrow
  {
    this.size = size;
    this.absolute = absolute;
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
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property gid.pango1.attribute.Attribute attr() nothrow
  {
    return cToD!(gid.pango1.attribute.Attribute)(cast(void*)&(cast(PangoAttrSize*)this._cPtr).attr);
  }

  /**
      Get `size` field.
      Returns: size of font, in units of 1/[gid.pango1.types.SCALE] of a point (for
          [gid.pango1.types.AttrType.Size]) or of a device unit (for [gid.pango1.types.AttrType.AbsoluteSize])
  */
  @property int size() nothrow
  {
    return (cast(PangoAttrSize*)this._cPtr).size;
  }

  /**
      Set `size` field.
      Params:
        propval = size of font, in units of 1/[gid.pango1.types.SCALE] of a point (for
            [gid.pango1.types.AttrType.Size]) or of a device unit (for [gid.pango1.types.AttrType.AbsoluteSize])
  */
  @property void size(int propval) nothrow
  {
    (cast(PangoAttrSize*)this._cPtr).size = propval;
  }

  /**
      Get `absolute` field.
      Returns: whether the font size is in device units or points.
          This field is only present for compatibility with Pango-1.8.0
          ([gid.pango1.types.AttrType.AbsoluteSize] was added in 1.8.1); and always will
          be false for [gid.pango1.types.AttrType.Size] and true for [gid.pango1.types.AttrType.AbsoluteSize].
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
            ([gid.pango1.types.AttrType.AbsoluteSize] was added in 1.8.1); and always will
            be false for [gid.pango1.types.AttrType.Size] and true for [gid.pango1.types.AttrType.AbsoluteSize].
  */
  @property void absolute(uint propval) nothrow
  {
    (cast(PangoAttrSize*)this._cPtr).absolute = propval;
  }

  /**
      Create a new font-size attribute in fractional points.
  
      Params:
        size = the font size, in [gid.pango1.types.SCALE]-ths of a point
      Returns: the newly allocated
          [gid.pango1.attribute.Attribute], which should be freed with
          [gid.pango1.attribute.Attribute.destroy]
  */
  static gid.pango1.attribute.Attribute new_(int size) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_size_new(size);
    auto _retval = _cretval ? new gid.pango1.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new font-size attribute in device units.
  
      Params:
        size = the font size, in [gid.pango1.types.SCALE]-ths of a device unit
      Returns: the newly allocated
          [gid.pango1.attribute.Attribute], which should be freed with
          [gid.pango1.attribute.Attribute.destroy]
  */
  static gid.pango1.attribute.Attribute newAbsolute(int size) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_size_new_absolute(size);
    auto _retval = _cretval ? new gid.pango1.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
