/// Module for [Attribute] class
module pango.attribute;

import gid.gid;
import gobject.boxed;
import pango.attr_color;
import pango.attr_float;
import pango.attr_font_desc;
import pango.attr_font_features;
import pango.attr_int;
import pango.attr_language;
import pango.attr_shape;
import pango.attr_size;
import pango.attr_string;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attribute.Attribute] structure represents the common portions of all
    attributes.
    
    Particular types of attributes include this structure as their initial
    portion. The common portion of the attribute holds the range to which
    the value in the type-specific part of the attribute applies and should
    be initialized using [pango.attribute.Attribute.init_]. By default, an attribute
    will have an all-inclusive range of [0,`G_MAXUINT`].
*/
class Attribute : gobject.boxed.Boxed
{

  /**
      Create a `attribute.Attribute` boxed type.
      Params:
        startIndex = the start index of the range (in bytes).
        endIndex = end index of the range (in bytes). The character at this index
            is not included in the range.
  */
  this(uint startIndex = uint.init, uint endIndex = uint.init)
  {
    super(gMalloc(PangoAttribute.sizeof), Yes.Take);
    this.startIndex = startIndex;
    this.endIndex = endIndex;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_attribute_get_type != &gidSymbolNotFound ? pango_attribute_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Attribute self()
  {
    return this;
  }

  /**
      Get `startIndex` field.
      Returns: the start index of the range (in bytes).
  */
  @property uint startIndex()
  {
    return (cast(PangoAttribute*)this._cPtr).startIndex;
  }

  /**
      Set `startIndex` field.
      Params:
        propval = the start index of the range (in bytes).
  */
  @property void startIndex(uint propval)
  {
    (cast(PangoAttribute*)this._cPtr).startIndex = propval;
  }

  /**
      Get `endIndex` field.
      Returns: end index of the range (in bytes). The character at this index
        is not included in the range.
  */
  @property uint endIndex()
  {
    return (cast(PangoAttribute*)this._cPtr).endIndex;
  }

  /**
      Set `endIndex` field.
      Params:
        propval = end index of the range (in bytes). The character at this index
          is not included in the range.
  */
  @property void endIndex(uint propval)
  {
    (cast(PangoAttribute*)this._cPtr).endIndex = propval;
  }

  /**
      Returns the attribute cast to [pango.attr_color.AttrColor].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_color.AttrColor],
          or null if it's not a color attribute
  */
  pango.attr_color.AttrColor asColor()
  {
    PangoAttrColor* _cretval;
    _cretval = pango_attribute_as_color(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_color.AttrColor(cast(PangoAttrColor*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_float.AttrFloat].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_float.AttrFloat],
          or null if it's not a floating point attribute
  */
  pango.attr_float.AttrFloat asFloat()
  {
    PangoAttrFloat* _cretval;
    _cretval = pango_attribute_as_float(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_float.AttrFloat(cast(PangoAttrFloat*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_font_desc.AttrFontDesc].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_font_desc.AttrFontDesc],
          or null if it's not a font description attribute
  */
  pango.attr_font_desc.AttrFontDesc asFontDesc()
  {
    PangoAttrFontDesc* _cretval;
    _cretval = pango_attribute_as_font_desc(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_font_desc.AttrFontDesc(cast(PangoAttrFontDesc*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_font_features.AttrFontFeatures].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_font_features.AttrFontFeatures],
          or null if it's not a font features attribute
  */
  pango.attr_font_features.AttrFontFeatures asFontFeatures()
  {
    PangoAttrFontFeatures* _cretval;
    _cretval = pango_attribute_as_font_features(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_font_features.AttrFontFeatures(cast(PangoAttrFontFeatures*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_int.AttrInt].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_int.AttrInt],
          or null if it's not an integer attribute
  */
  pango.attr_int.AttrInt asInt()
  {
    PangoAttrInt* _cretval;
    _cretval = pango_attribute_as_int(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_int.AttrInt(cast(PangoAttrInt*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_language.AttrLanguage].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_language.AttrLanguage],
          or null if it's not a language attribute
  */
  pango.attr_language.AttrLanguage asLanguage()
  {
    PangoAttrLanguage* _cretval;
    _cretval = pango_attribute_as_language(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_language.AttrLanguage(cast(PangoAttrLanguage*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_shape.AttrShape].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_shape.AttrShape],
          or null if it's not a shape attribute
  */
  pango.attr_shape.AttrShape asShape()
  {
    PangoAttrShape* _cretval;
    _cretval = pango_attribute_as_shape(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_shape.AttrShape(cast(PangoAttrShape*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_size.AttrSize].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_size.AttrSize],
          or NULL if it's not a size attribute
  */
  pango.attr_size.AttrSize asSize()
  {
    PangoAttrSize* _cretval;
    _cretval = pango_attribute_as_size(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_size.AttrSize(cast(PangoAttrSize*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the attribute cast to [pango.attr_string.AttrString].
      
      This is mainly useful for language bindings.
      Returns: The attribute as [pango.attr_string.AttrString],
          or null if it's not a string attribute
  */
  pango.attr_string.AttrString asString()
  {
    PangoAttrString* _cretval;
    _cretval = pango_attribute_as_string(cast(PangoAttribute*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_string.AttrString(cast(PangoAttrString*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Make a copy of an attribute.
      Returns: the newly allocated
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy].
  */
  pango.attribute.Attribute copy()
  {
    PangoAttribute* _cretval;
    _cretval = pango_attribute_copy(cast(const(PangoAttribute)*)this._cPtr);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Destroy a [pango.attribute.Attribute] and free all associated memory.
  */
  void destroy()
  {
    pango_attribute_destroy(cast(PangoAttribute*)this._cPtr);
  }

  /**
      Compare two attributes for equality.
      
      This compares only the actual value of the two
      attributes and not the ranges that the attributes
      apply to.
  
      Params:
        attr2 = another [pango.attribute.Attribute]
      Returns: true if the two attributes have the same value
  */
  bool equal(pango.attribute.Attribute attr2)
  {
    bool _retval;
    _retval = cast(bool)pango_attribute_equal(cast(const(PangoAttribute)*)this._cPtr, attr2 ? cast(const(PangoAttribute)*)attr2._cPtr(No.Dup) : null);
    return _retval;
  }
}
