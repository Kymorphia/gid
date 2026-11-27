/// Module for [Multipart] class
module gid.soup3.multipart;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.bytes;
import gid.gobject2.boxed;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message_headers;
import gid.soup3.types;

/**
    Represents a multipart HTTP message body, parsed according to the
    syntax of RFC 2046.
    
    Of particular interest to HTTP are `multipart/byte-ranges` and
    `multipart/form-data`,
    
    Although the headers of a [gid.soup3.multipart.Multipart] body part will contain the
    full headers from that body part, libsoup does not interpret them
    according to MIME rules. For example, each body part is assumed to
    have "binary" Content-Transfer-Encoding, even if its headers
    explicitly state otherwise. In other words, don't try to use
    [gid.soup3.multipart.Multipart] for handling real MIME multiparts.
*/
@gidGir("Multipart")
class Multipart : gid.gobject2.boxed.BoxedWrap!(soup_multipart_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Multipart self() nothrow
  {
    return this;
  }

  /**
      Creates a new empty [gid.soup3.multipart.Multipart] with a randomly-generated
      boundary string.
      
      Note that mime_type must be the full MIME type, including "multipart/".
      
      See also: [gid.soup3.message.Message.newFromMultipart].
  
      Params:
        mimeType = the MIME type of the multipart to create.
      Returns: a new empty #SoupMultipart of the given mime_type
  */
  this(string mimeType) nothrow
  {
    SoupMultipart* _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    _cretval = soup_multipart_new(_mimeType);
    this(_cretval, Yes.Take);
  }

  /**
      Parses headers and body to form a new [gid.soup3.multipart.Multipart]
  
      Params:
        headers = the headers of the HTTP message to parse
        body_ = the body of the HTTP message to parse
      Returns: a new #SoupMultipart (or null if the
          message couldn't be parsed or wasn't multipart).
  */
  static gid.soup3.multipart.Multipart newFromMessage(gid.soup3.message_headers.MessageHeaders headers, gid.glib2.bytes.Bytes body_) nothrow
  {
    SoupMultipart* _cretval;
    _cretval = soup_multipart_new_from_message(headers ? cast(SoupMessageHeaders*)headers._cPtr(No.Dup) : null, body_ ? cast(GBytes*)body_._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.soup3.multipart.Multipart(cast(void*)_cretval, Yes.Take) : null;
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
  void appendFormFile(string controlName, string filename, string contentType, gid.glib2.bytes.Bytes body_) nothrow
  {
    const(char)* _controlName = controlName.toCString!(No.Malloc, No.Nullable);
    const(char)* _filename = filename.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _contentType = contentType.toCString!(No.Malloc, Yes.Nullable);
    soup_multipart_append_form_file(cast(SoupMultipart*)this._cPtr, _controlName, _filename, _contentType, body_ ? cast(GBytes*)body_._cPtr(No.Dup) : null);
  }

  /**
      Adds a new MIME part containing data to multipart.
      
      Uses "Content-Disposition: form-data", as per the HTML forms specification.
  
      Params:
        controlName = the name of the control associated with data
        data = the body data
  */
  void appendFormString(string controlName, string data) nothrow
  {
    const(char)* _controlName = controlName.toCString!(No.Malloc, No.Nullable);
    const(char)* _data = data.toCString!(No.Malloc, No.Nullable);
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
  void appendPart(gid.soup3.message_headers.MessageHeaders headers, gid.glib2.bytes.Bytes body_) nothrow
  {
    soup_multipart_append_part(cast(SoupMultipart*)this._cPtr, headers ? cast(SoupMessageHeaders*)headers._cPtr(No.Dup) : null, body_ ? cast(GBytes*)body_._cPtr(No.Dup) : null);
  }

  /**
      Gets the number of body parts in multipart.
      Returns: the number of body parts in multipart
  */
  int getLength() nothrow
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
  bool getPart(int part, out gid.soup3.message_headers.MessageHeaders headers, out gid.glib2.bytes.Bytes body_) nothrow
  {
    bool _retval;
    SoupMessageHeaders* _headers;
    GBytes* _body_;
    _retval = cast(bool)soup_multipart_get_part(cast(SoupMultipart*)this._cPtr, part, &_headers, &_body_);
    if (_headers)
      headers = new gid.soup3.message_headers.MessageHeaders(cast(void*)_headers, No.Take);
    if (_body_)
      body_ = new gid.glib2.bytes.Bytes(cast(void*)_body_, No.Take);
    return _retval;
  }

  /**
      Serializes multipart to dest_headers and dest_body.
  
      Params:
        destHeaders = the headers of the HTTP message to serialize multipart to
        destBody = the body of the HTTP message to serialize multipart to
  */
  void toMessage(gid.soup3.message_headers.MessageHeaders destHeaders, out gid.glib2.bytes.Bytes destBody) nothrow
  {
    GBytes* _destBody;
    soup_multipart_to_message(cast(SoupMultipart*)this._cPtr, destHeaders ? cast(SoupMessageHeaders*)destHeaders._cPtr(No.Dup) : null, &_destBody);
    if (_destBody)
      destBody = new gid.glib2.bytes.Bytes(cast(void*)_destBody, Yes.Take);
  }
}
