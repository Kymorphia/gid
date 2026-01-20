/// Module for [References] class
module gmime.references;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.parser_options;
import gmime.types;
import gobject.boxed;

/**
    A List of references, as per the References or In-Reply-To header
    fields.
*/
class References : gobject.boxed.Boxed
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
    return cast(void function())g_mime_references_get_type != &gidSymbolNotFound ? g_mime_references_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override References self()
  {
    return this;
  }

  /**
      Creates a new #GMimeReferences.
      Returns: a new #GMimeReferences.
  */
  this()
  {
    GMimeReferences* _cretval;
    _cretval = g_mime_references_new();
    this(_cretval, Yes.Take);
  }

  /**
      Appends a reference to msgid to the list of references.
  
      Params:
        msgid = a message-id string
  */
  void append(string msgid)
  {
    const(char)* _msgid = msgid.toCString(No.Alloc);
    g_mime_references_append(cast(GMimeReferences*)this._cPtr, _msgid);
  }

  /**
      Clears the #GMimeReferences list.
  */
  void clear()
  {
    g_mime_references_clear(cast(GMimeReferences*)this._cPtr);
  }

  /**
      Copies a #GMimeReferences list.
      Returns: a new #GMimeReferences list that contains
        an identical list of items as refs.
  */
  gmime.references.References copy()
  {
    GMimeReferences* _cretval;
    _cretval = g_mime_references_copy(cast(GMimeReferences*)this._cPtr);
    auto _retval = _cretval ? new gmime.references.References(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the specified Message-Id reference from the #GMimeReferences.
  
      Params:
        index = the index of the message id
      Returns: the Message-Id reference from the #GMimeReferences.
  */
  string getMessageId(int index)
  {
    const(char)* _cretval;
    _cretval = g_mime_references_get_message_id(cast(GMimeReferences*)this._cPtr, index);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the length of the #GMimeReferences list.
      Returns: the number of message ids in the list.
  */
  int length()
  {
    int _retval;
    _retval = g_mime_references_length(cast(GMimeReferences*)this._cPtr);
    return _retval;
  }

  /**
      Sets the specified Message-Id reference from the #GMimeReferences.
  
      Params:
        index = the index of the message id
        msgid = the message id
  */
  void setMessageId(int index, string msgid)
  {
    const(char)* _msgid = msgid.toCString(No.Alloc);
    g_mime_references_set_message_id(cast(GMimeReferences*)this._cPtr, index, _msgid);
  }

  /**
      Decodes a list of msg-ids as in the References and/or In-Reply-To
      headers defined in rfc822.
  
      Params:
        options = a #GMimeParserOptions or null
        text = string containing a list of msg-ids
      Returns: a new #GMimeReferences containing the parsed message ids.
  */
  static gmime.references.References parse(gmime.parser_options.ParserOptions options, string text)
  {
    GMimeReferences* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = g_mime_references_parse(options ? cast(GMimeParserOptions*)options._cPtr(No.Dup) : null, _text);
    auto _retval = _cretval ? new gmime.references.References(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
