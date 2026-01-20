/// Module for [Multipart] class
module soup.multipart;

import gid.gid;
import glib.bytes;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.message_headers;
import soup.types;

/**
    Represents a multipart HTTP message body, parsed according to the
    syntax of RFC 2046.
    
    Of particular interest to HTTP are `multipart/byte-ranges` and
    `multipart/form-data`,
    
    Although the headers of a #SoupMultipart body part will contain the
    full headers from that body part, libsoup does not interpret them
    according to MIME rules. For example, each body part is assumed to
    have "binary" Content-Transfer-Encoding, even if its headers
    explicitly state otherwise. In other words, don't try to use
    #SoupMultipart for handling real MIME multiparts.
*/
class Multipart : gobject.boxed.Boxed
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
    return cast(void function())soup_multipart_get_type != &gidSymbolNotFound ? soup_multipart_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Multipart self()
  {
    return this;
  }

  /**
      Creates a new empty #SoupMultipart with a randomly-generated
      boundary string.
      
      Note that mime_type must be the full MIME type, including "multipart/".
      
      See also: [soup.message.Message.newFromMultipart].
  
      Params:
        mimeType = the MIME type of the multipart to create.
      Returns: a new empty #SoupMultipart of the given mime_type
  */
  this(string mimeType)
  {
    SoupMultipart* _cretval;
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    _cretval = soup_multipart_new(_mimeType);
    this(_cretval, Yes.Take);
  }

  /**
      Parses headers and body to form a new #SoupMultipart
  
      Params:
        headers = the headers of the HTTP message to parse
        body_ = the body of the HTTP message to parse
      Returns: a new #SoupMultipart (or null if the
          message couldn't be parsed or wasn't multipart).
  */
  static soup.multipart.Multipart newFromMessage(soup.message_headers.MessageHeaders headers, glib.bytes.Bytes body_)
  {
    SoupMultipart* _cretval;
    _cretval = soup_multipart_new_from_message(headers ? cast(SoupMessageHeaders*)headers._cPtr(No.Dup) : null, body_ ? cast(GBytes*)body_._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new soup.multipart.Multipart(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Adds a new MIME part containing body to multipart
      
      Uses "Content-Disposition: form-data", as per the HTML forms specification.
  
      Params:
        controlName = the name of the control associated with this file
        filename = the name of the file, or null if not known
        contentType = the MIME type of the file, or null if not known
        body_ = the file data
  */
  void appendFormFile(string controlName, string filename, string contentType, glib.bytes.Bytes body_)
  {
    const(char)* _controlName = controlName.toCString(No.Alloc);
    const(char)* _filename = filename.toCString(No.Alloc);
    const(char)* _contentType = contentType.toCString(No.Alloc);
    soup_multipart_append_form_file(cast(SoupMultipart*)this._cPtr, _controlName, _filename, _contentType, body_ ? cast(GBytes*)body_._cPtr(No.Dup) : null);
  }

  /**
      Adds a new MIME part containing data to multipart.
      
      Uses "Content-Disposition: form-data", as per the HTML forms specification.
  
      Params:
        controlName = the name of the control associated with data
        data = the body data
  */
  void appendFormString(string controlName, string data)
  {
    const(char)* _controlName = controlName.toCString(No.Alloc);
    const(char)* _data = data.toCString(No.Alloc);
    soup_multipart_append_form_string(cast(SoupMultipart*)this._cPtr, _controlName, _data);
  }

  /**
      Adds a new MIME part to multipart with the given headers and body.
      
      (The multipart will make its own copies of headers and body, so
      you should free your copies if you are not using them for anything
      else.)
  
      Params:
        headers = the MIME part headers
        body_ = the MIME part body
  */
  void appendPart(soup.message_headers.MessageHeaders headers, glib.bytes.Bytes body_)
  {
    soup_multipart_append_part(cast(SoupMultipart*)this._cPtr, headers ? cast(SoupMessageHeaders*)headers._cPtr(No.Dup) : null, body_ ? cast(GBytes*)body_._cPtr(No.Dup) : null);
  }

  /**
      Gets the number of body parts in multipart.
      Returns: the number of body parts in multipart
  */
  int getLength()
  {
    int _retval;
    _retval = soup_multipart_get_length(cast(SoupMultipart*)this._cPtr);
    return _retval;
  }

  /**
      Gets the indicated body part from multipart.
  
      Params:
        part = the part number to get (counting from 0)
        headers = return location for the MIME part
            headers
        body_ = return location for the MIME part
            body
      Returns: true on success, false if part is out of range (in
          which case headers and body won't be set)
  */
  bool getPart(int part, out soup.message_headers.MessageHeaders headers, out glib.bytes.Bytes body_)
  {
    bool _retval;
    SoupMessageHeaders* _headers;
    GBytes* _body_;
    _retval = cast(bool)soup_multipart_get_part(cast(SoupMultipart*)this._cPtr, part, &_headers, &_body_);
    headers = new soup.message_headers.MessageHeaders(cast(void*)_headers, No.Take);
    body_ = new glib.bytes.Bytes(cast(void*)_body_, No.Take);
    return _retval;
  }

  /**
      Serializes multipart to dest_headers and dest_body.
  
      Params:
        destHeaders = the headers of the HTTP message to serialize multipart to
        destBody = the body of the HTTP message to serialize multipart to
  */
  void toMessage(soup.message_headers.MessageHeaders destHeaders, out glib.bytes.Bytes destBody)
  {
    GBytes* _destBody;
    soup_multipart_to_message(cast(SoupMultipart*)this._cPtr, destHeaders ? cast(SoupMessageHeaders*)destHeaders._cPtr(No.Dup) : null, &_destBody);
    destBody = new glib.bytes.Bytes(cast(void*)_destBody, Yes.Take);
  }
}
