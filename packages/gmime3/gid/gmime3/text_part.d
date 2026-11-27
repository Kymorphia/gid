/// Module for [TextPart] class
module gid.gmime3.text_part;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.part;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A text MIME part object.
*/
@gidGir("TextPart", "TextPartClass")
class TextPart : gid.gmime3.part.Part
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_text_part_get_type != &gidSymbolNotFound ? g_mime_text_part_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeTextPart";
  }

  /** Returns `this`, for use in `with` statements. */
  override TextPart self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.text_part.TextPart]
      Returns: New builder object
  */
  static TextPartGidBuilder builder() nothrow
  {
    return new TextPartGidBuilder;
  }

  /**
      Creates a new text MIME part object with a default content-type of
      text/plain.
      Returns: an empty MIME Part object with a default content-type of
        text/plain.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeTextPart* _cretval;
      _cretval = g_mime_text_part_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new text MIME part with a sepcified subtype.
  
      Params:
        subtype = textual subtype string
      Returns: an empty text MIME part object with the specified subtype.
  */
  static gid.gmime3.text_part.TextPart newWithSubtype(string subtype) nothrow
  {
    GMimeTextPart* _cretval;
    const(char)* _subtype = subtype.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_text_part_new_with_subtype(_subtype);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.text_part.TextPart)(cast(GMimeTextPart*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of the charset parameter on the Content-Type header.
      Returns: the value of the charset parameter or null if unavailable.
  */
  string getCharset() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_text_part_get_charset(cast(GMimeTextPart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the text content of the mime_part as a string.
      Returns: a newly allocated string containing the utf-8 encoded text content.
  */
  string getText() nothrow
  {
    char* _cretval;
    _cretval = g_mime_text_part_get_text(cast(GMimeTextPart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Sets the charset parameter on the Content-Type header to the specified value.
  
      Params:
        charset = the name of the charset
  */
  void setCharset(string charset) nothrow
  {
    const(char)* _charset = charset.toCString!(No.Malloc, No.Nullable);
    g_mime_text_part_set_charset(cast(GMimeTextPart*)this._cPtr, _charset);
  }

  /**
      Sets the specified text as the content and updates the charset parameter on the Content-Type header.
  
      Params:
        text = the text in utf-8
  */
  void setText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    g_mime_text_part_set_text(cast(GMimeTextPart*)this._cPtr, _text);
  }
}

/// Fluent builder implementation template for [gid.gmime3.text_part.TextPart]
class TextPartGidBuilderImpl(T) : gid.gmime3.part.PartGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.text_part.TextPart]
final class TextPartGidBuilder : TextPartGidBuilderImpl!TextPartGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextPart build() nothrow
  {
    return new TextPart(cast(void*)createGObject(TextPart._getGType), Yes.Take);
  }
}
