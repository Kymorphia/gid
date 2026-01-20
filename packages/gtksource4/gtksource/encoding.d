/// Module for [Encoding] class
module gtksource.encoding;

import gid.gid;
import gobject.boxed;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class Encoding : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_encoding_get_type != &gidSymbolNotFound ? gtk_source_encoding_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Encoding self()
  {
    return this;
  }

  /**
      Used by language bindings.
      Returns: a copy of enc.
  */
  gtksource.encoding.Encoding copy()
  {
    GtkSourceEncoding* _cretval;
    _cretval = gtk_source_encoding_copy(cast(const(GtkSourceEncoding)*)this._cPtr);
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the character set of the #GtkSourceEncoding, such as "UTF-8" or
      "ISO-8859-1".
      Returns: the character set of the #GtkSourceEncoding.
  */
  string getCharset()
  {
    const(char)* _cretval;
    _cretval = gtk_source_encoding_get_charset(cast(const(GtkSourceEncoding)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name of the #GtkSourceEncoding such as "Unicode" or "Western".
      Returns: the name of the #GtkSourceEncoding.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_encoding_get_name(cast(const(GtkSourceEncoding)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_source_encoding_to_string(cast(const(GtkSourceEncoding)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets all encodings.
      Returns: a list of
        all #GtkSourceEncoding's. Free with [glib.slist.SList.free].
  */
  static gtksource.encoding.Encoding[] getAll()
  {
    GSList* _cretval;
    _cretval = gtk_source_encoding_get_all();
    auto _retval = gSListToD!(gtksource.encoding.Encoding, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets the #GtkSourceEncoding for the current locale. See also [glib.global.getCharset].
      Returns: the current locale encoding.
  */
  static gtksource.encoding.Encoding getCurrent()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_encoding_get_current();
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the list of default candidate encodings to try when loading a file. See
      [gtksource.file_loader.FileLoader.setCandidateEncodings].
      
      This function returns a different list depending on the current locale (i.e.
      language, country and default encoding). The UTF-8 encoding and the current
      locale encoding are guaranteed to be present in the returned list.
      Returns: the list of
        default candidate encodings. Free with [glib.slist.SList.free].
  */
  static gtksource.encoding.Encoding[] getDefaultCandidates()
  {
    GSList* _cretval;
    _cretval = gtk_source_encoding_get_default_candidates();
    auto _retval = gSListToD!(gtksource.encoding.Encoding, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Gets a #GtkSourceEncoding from a character set such as "UTF-8" or
      "ISO-8859-1".
  
      Params:
        charset = a character set.
      Returns: the corresponding #GtkSourceEncoding, or null
        if not found.
  */
  static gtksource.encoding.Encoding getFromCharset(string charset)
  {
    const(GtkSourceEncoding)* _cretval;
    const(char)* _charset = charset.toCString(No.Alloc);
    _cretval = gtk_source_encoding_get_from_charset(_charset);
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  static gtksource.encoding.Encoding getUtf8()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_encoding_get_utf8();
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
