/// Module for [AttrFontDesc] class
module gid.pango1.attr_font_desc;

public import gid.core.basictypes;
import gid.core.gid;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font_description;
import gid.pango1.types;

/**
    The [gid.pango1.attr_font_desc.AttrFontDesc] structure is used to store an attribute that
    sets all aspects of the font description at once.
*/
class AttrFontDesc : StructWrap!(PangoAttrFontDesc)
{
  /**
      Create a `attr_font_desc.AttrFontDesc` wrap type.
      Params:
        desc = the font description which is the value of this attribute
  */
  this(gid.pango1.font_description.FontDescription desc = gid.pango1.font_description.FontDescription.init) nothrow
  {
    this.desc = desc;
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
    return cToD!(gid.pango1.attribute.Attribute)(cast(void*)&(cast(PangoAttrFontDesc*)this._cPtr).attr);
  }

  private gid.pango1.font_description.FontDescription _descRef; // Keeps borrowed field value alive

  /**
      Get `desc` field.
      Returns: the font description which is the value of this attribute
  */
  @property gid.pango1.font_description.FontDescription desc() nothrow
  {
    return cToD!(gid.pango1.font_description.FontDescription)(cast(void*)(cast(PangoAttrFontDesc*)this._cPtr).desc);
  }

  /**
      Set `desc` field.
      Params:
        propval = the font description which is the value of this attribute
  */
  @property void desc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    if (_refuseBorrowedStore("desc"))
      return;

    _descRef = propval;
    (cast(PangoAttrFontDesc*)this._cPtr).desc = propval ? cast(PangoFontDescription*)propval._cPtr(No.Dup) : null;
  }

  /**
      Create a new font description attribute.
      
      This attribute allows setting family, style, weight, variant,
      stretch, and size simultaneously.
  
      Params:
        desc = the font description
      Returns: the newly allocated
          [gid.pango1.attribute.Attribute], which should be freed with
          [gid.pango1.attribute.Attribute.destroy]
  */
  static gid.pango1.attribute.Attribute new_(gid.pango1.font_description.FontDescription desc) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_font_desc_new(desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.pango1.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
