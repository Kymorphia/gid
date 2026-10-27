/// Module for [AttrLanguage] class
module pango.attr_language;

public import gid.basictypes;
import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.language;
import pango.types;

/**
    The [pango.attr_language.AttrLanguage] structure is used to represent attributes that
    are languages.
*/
class AttrLanguage
{
  PangoAttrLanguage _cInstance;

  /**
      Create a `attr_language.AttrLanguage` wrap type.
      Params:
        value = the [pango.language.Language] which is the value of the attribute
  */
  this(pango.language.Language value = pango.language.Language.init) nothrow
  {
    this.value = value;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(PangoAttrLanguage*)ptr;

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
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrLanguage*)this._cPtr).attr);
  }

  private pango.language.Language _valueRef; // Keeps borrowed field value alive

  /**
      Get `value` field.
      Returns: the [pango.language.Language] which is the value of the attribute
  */
  @property pango.language.Language value() nothrow
  {
    return cToD!(pango.language.Language)(cast(void*)(cast(PangoAttrLanguage*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the [pango.language.Language] which is the value of the attribute
  */
  @property void value(pango.language.Language propval) nothrow
  {
    _valueRef = propval;
    (cast(PangoAttrLanguage*)this._cPtr).value = propval ? cast(PangoLanguage*)propval._cPtr(No.Dup) : null;
  }

  /**
      Create a new language tag attribute.
  
      Params:
        language = language tag
      Returns: the newly allocated
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(pango.language.Language language) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_language_new(language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
