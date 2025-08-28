/// Module for [TextPart] class
module gmime.text_part;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.part;
import gmime.types;
import gobject.object;

/**
    A text MIME part object.
*/
class TextPart : gmime.part.Part
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_text_part_get_type != &gidSymbolNotFound ? g_mime_text_part_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextPart self()
  {
    return this;
  }

  /**
      Creates a new text MIME part object with a default content-type of
      text/plain.
      Returns: an empty MIME Part object with a default content-type of
        text/plain.
  */
  this()
  {
    GMimeTextPart* _cretval;
    _cretval = g_mime_text_part_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new text MIME part with a sepcified subtype.
  
      Params:
        subtype = textual subtype string
      Returns: an empty text MIME part object with the specified subtype.
  */
  static gmime.text_part.TextPart newWithSubtype(string subtype)
  {
    GMimeTextPart* _cretval;
    const(char)* _subtype = subtype.toCString(No.Alloc);
    _cretval = g_mime_text_part_new_with_subtype(_subtype);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.text_part.TextPart)(cast(GMimeTextPart*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of the charset parameter on the Content-Type header.
      Returns: the value of the charset parameter or null if unavailable.
  */
  string getCharset()
  {
    const(char)* _cretval;
    _cretval = g_mime_text_part_get_charset(cast(GMimeTextPart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the text content of the mime_part as a string.
      Returns: a newly allocated string containing the utf-8 encoded text content.
  */
  string getText()
  {
    char* _cretval;
    _cretval = g_mime_text_part_get_text(cast(GMimeTextPart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Sets the charset parameter on the Content-Type header to the specified value.
  
      Params:
        charset = the name of the charset
  */
  void setCharset(string charset)
  {
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_text_part_set_charset(cast(GMimeTextPart*)this._cPtr, _charset);
  }

  /**
      Sets the specified text as the content and updates the charset parameter on the Content-Type header.
  
      Params:
        text = the text in utf-8
  */
  void setText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    g_mime_text_part_set_text(cast(GMimeTextPart*)this._cPtr, _text);
  }
}
