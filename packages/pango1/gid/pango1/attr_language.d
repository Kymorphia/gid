/// Module for [AttrLanguage] class
module gid.pango1.attr_language;

public import gid.core.basictypes;
import gid.core.gid;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.language;
import gid.pango1.types;

/**
    The [gid.pango1.attr_language.AttrLanguage] structure is used to represent attributes that
    are languages.
*/
class AttrLanguage : StructWrap!(PangoAttrLanguage)
{
  /**
      Create a `attr_language.AttrLanguage` wrap type.
      Params:
        value = the [gid.pango1.language.Language] which is the value of the attribute
  */
  this(gid.pango1.language.Language value = gid.pango1.language.Language.init) nothrow
  {
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

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property gid.pango1.attribute.Attribute attr() nothrow
  {
    return cToD!(gid.pango1.attribute.Attribute)(cast(void*)&(cast(PangoAttrLanguage*)this._cPtr).attr);
  }

  private gid.pango1.language.Language _valueRef; // Keeps borrowed field value alive

  /**
      Get `value` field.
      Returns: the [gid.pango1.language.Language] which is the value of the attribute
  */
  @property gid.pango1.language.Language value() nothrow
  {
    return cToD!(gid.pango1.language.Language)(cast(void*)(cast(PangoAttrLanguage*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the [gid.pango1.language.Language] which is the value of the attribute
  */
  @property void value(gid.pango1.language.Language propval) nothrow
  {
    if (_refuseBorrowedStore("value"))
      return;

    _valueRef = propval;
    (cast(PangoAttrLanguage*)this._cPtr).value = propval ? cast(PangoLanguage*)propval._cPtr(No.Dup) : null;
  }

  /**
      Create a new language tag attribute.
  
      Params:
        language = language tag
      Returns: the newly allocated
          [gid.pango1.attribute.Attribute], which should be freed with
          [gid.pango1.attribute.Attribute.destroy]
  */
  static gid.pango1.attribute.Attribute new_(gid.pango1.language.Language language) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_language_new(language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.pango1.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
