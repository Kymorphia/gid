/// Module for [AttrFontDesc] class
module pango.attr_font_desc;

public import gid.basictypes;
import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.font_description;
import pango.types;

/**
    The [pango.attr_font_desc.AttrFontDesc] structure is used to store an attribute that
    sets all aspects of the font description at once.
*/
class AttrFontDesc
{
  PangoAttrFontDesc _cInstance;

  /**
      Create a `attr_font_desc.AttrFontDesc` wrap type.
      Params:
        desc = the font description which is the value of this attribute
  */
  this(pango.font_description.FontDescription desc = pango.font_description.FontDescription.init) nothrow
  {
    this.desc = desc;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoAttrFontDesc*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr() nothrow
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFontDesc*)this._cPtr).attr);
  }

  private pango.font_description.FontDescription _descRef; // Keeps borrowed field value alive

  /**
      Get `desc` field.
      Returns: the font description which is the value of this attribute
  */
  @property pango.font_description.FontDescription desc() nothrow
  {
    return cToD!(pango.font_description.FontDescription)(cast(void*)(cast(PangoAttrFontDesc*)this._cPtr).desc);
  }

  /**
      Set `desc` field.
      Params:
        propval = the font description which is the value of this attribute
  */
  @property void desc(pango.font_description.FontDescription propval) nothrow
  {
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
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(pango.font_description.FontDescription desc) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_font_desc_new(desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
