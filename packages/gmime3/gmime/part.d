/// Module for [Part] class
module gmime.part;

import gid.gid;
import glib.error;
import gmime.c.functions;
import gmime.c.types;
import gmime.data_wrapper;
import gmime.decrypt_result;
import gmime.object;
import gmime.signature_list;
import gmime.types;
import gobject.object;

/**
    A leaf-node MIME part object.
*/
class Part : gmime.object.ObjectWrap
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
    return cast(void function())g_mime_part_get_type != &gidSymbolNotFound ? g_mime_part_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Part self()
  {
    return this;
  }

  /**
      Creates a new MIME Part object with a default content-type of
      application/octet-stream.
      Returns: an empty MIME Part object with a default content-type of
        application/octet-stream.
  */
  this()
  {
    GMimePart* _cretval;
    _cretval = g_mime_part_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new MIME Part with a sepcified type.
  
      Params:
        type = content-type string
        subtype = content-subtype string
      Returns: an empty MIME Part object with the specified content-type.
  */
  static gmime.part.Part newWithType(string type, string subtype)
  {
    GMimePart* _cretval;
    const(char)* _type = type.toCString(No.Alloc);
    const(char)* _subtype = subtype.toCString(No.Alloc);
    _cretval = g_mime_part_new_with_type(_type, _subtype);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.part.Part)(cast(GMimePart*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Calculates the most efficient content encoding for the mime_part
      given the constraint.
  
      Params:
        constraint = a #GMimeEncodingConstraint
      Returns: the best content encoding for the specified mime part.
  */
  gmime.types.ContentEncoding getBestContentEncoding(gmime.types.EncodingConstraint constraint)
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_part_get_best_content_encoding(cast(GMimePart*)this._cPtr, constraint);
    gmime.types.ContentEncoding _retval = cast(gmime.types.ContentEncoding)_cretval;
    return _retval;
  }

  /**
      Gets the internal data-wrapper of the specified mime part, or null
      on error.
      Returns: the data-wrapper for the mime part's
        contents.
  */
  gmime.data_wrapper.DataWrapper getContent()
  {
    GMimeDataWrapper* _cretval;
    _cretval = g_mime_part_get_content(cast(GMimePart*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.data_wrapper.DataWrapper)(cast(GMimeDataWrapper*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the Content-Description for the specified mime
      part if it exists or null otherwise.
      Returns: the content description for the specified mime part.
  */
  string getContentDescription()
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_description(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the content encoding of the mime part.
      Returns: the content encoding for the specified mime part.
  */
  gmime.types.ContentEncoding getContentEncoding()
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_part_get_content_encoding(cast(GMimePart*)this._cPtr);
    gmime.types.ContentEncoding _retval = cast(gmime.types.ContentEncoding)_cretval;
    return _retval;
  }

  /**
      Gets the content-id of the specified mime part if it exists, or
      null otherwise.
      Returns: the content id for the specified mime part.
  */
  override string getContentId()
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_id(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of the Content-Location header if it exists, or
      null otherwise.
      Returns: the content location for the specified mime part.
  */
  string getContentLocation()
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_location(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the md5sum contained in the Content-Md5 header of the
      specified mime part if it exists, or null otherwise.
      Returns: the content md5 for the specified mime part.
  */
  string getContentMd5()
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_md5(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the filename of the specificed mime part, or null if the
      mime_part does not have the filename or name parameter set.
      Returns: the filename of the specified mime_part or null if
        neither of the parameters is set. If a file name is set, the
        returned string will be in UTF-8.
  */
  string getFilename()
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_filename(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether or not (and what type) of OpenPGP data is contained
      within the #GMimePart.
      Returns: a #GMimeOpenPGPData.
  */
  gmime.types.OpenPGPData getOpenpgpData()
  {
    GMimeOpenPGPData _cretval;
    _cretval = g_mime_part_get_openpgp_data(cast(GMimePart*)this._cPtr);
    gmime.types.OpenPGPData _retval = cast(gmime.types.OpenPGPData)_cretval;
    return _retval;
  }

  /**
      Determines whether or not the part is an attachment based on the
      value of the Content-Disposition header.
      Returns: true if the part is an attachment, otherwise false.
  */
  bool isAttachment()
  {
    bool _retval;
    _retval = g_mime_part_is_attachment(cast(GMimePart*)this._cPtr);
    return _retval;
  }

  /**
      Decrypts the content of the mime_part and then replaces the content with
      the new, decrypted, content.
  
      Params:
        flags = a set of #GMimeDecryptFlags
        sessionKey = the session key to use or null
      Returns: a #GMimeDecryptResult on success or null on error.
      Throws: [ErrorWrap]
  */
  gmime.decrypt_result.DecryptResult openpgpDecrypt(gmime.types.DecryptFlags flags, string sessionKey = null)
  {
    GMimeDecryptResult* _cretval;
    const(char)* _sessionKey = sessionKey.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_part_openpgp_decrypt(cast(GMimePart*)this._cPtr, flags, _sessionKey, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.decrypt_result.DecryptResult)(cast(GMimeDecryptResult*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Encrypts (and optionally signs) the content of the mime_part and then replaces
      the content with the new, encrypted, content.
  
      Params:
        sign = true if the content should also be signed; otherwise, false
        userid = the key id (or email address) to use when signing (assuming sign is true)
        flags = a set of #GMimeEncryptFlags
        recipients = an array of recipient key ids and/or email addresses
      Returns: true on success or false on error.
      Throws: [ErrorWrap]
  */
  bool openpgpEncrypt(bool sign, string userid, gmime.types.EncryptFlags flags, string[] recipients)
  {
    bool _retval;
    const(char)* _userid = userid.toCString(No.Alloc);
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _retval = g_mime_part_openpgp_encrypt(cast(GMimePart*)this._cPtr, sign, _userid, flags, _recipients, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Signs the content of the mime_part and then replaces the content with
      the new, signed, content.
  
      Params:
        userid = the key id (or email address) to use for signing
      Returns: true on success or false on error.
      Throws: [ErrorWrap]
  */
  bool openpgpSign(string userid)
  {
    bool _retval;
    const(char)* _userid = userid.toCString(No.Alloc);
    GError *_err;
    _retval = g_mime_part_openpgp_sign(cast(GMimePart*)this._cPtr, _userid, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Verifies the OpenPGP signature of the mime_part and then replaces the content
      with the original, raw, content.
  
      Params:
        flags = a set of #GMimeVerifyFlags
      Returns: a #GMimeSignatureList on success or null on error.
      Throws: [ErrorWrap]
  */
  gmime.signature_list.SignatureList openpgpVerify(gmime.types.VerifyFlags flags)
  {
    GMimeSignatureList* _cretval;
    GError *_err;
    _cretval = g_mime_part_openpgp_verify(cast(GMimePart*)this._cPtr, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the content on the mime part.
  
      Params:
        content = a #GMimeDataWrapper content object
  */
  void setContent(gmime.data_wrapper.DataWrapper content)
  {
    g_mime_part_set_content(cast(GMimePart*)this._cPtr, content ? cast(GMimeDataWrapper*)content._cPtr(No.Dup) : null);
  }

  /**
      Set the content description for the specified mime part.
  
      Params:
        description = content description
  */
  void setContentDescription(string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    g_mime_part_set_content_description(cast(GMimePart*)this._cPtr, _description);
  }

  /**
      Set the content encoding for the specified mime part.
  
      Params:
        encoding = a #GMimeContentEncoding
  */
  void setContentEncoding(gmime.types.ContentEncoding encoding)
  {
    g_mime_part_set_content_encoding(cast(GMimePart*)this._cPtr, encoding);
  }

  /**
      Set the content id for the specified mime part.
  
      Params:
        contentId = content id
  */
  override void setContentId(string contentId)
  {
    const(char)* _contentId = contentId.toCString(No.Alloc);
    g_mime_part_set_content_id(cast(GMimePart*)this._cPtr, _contentId);
  }

  /**
      Set the content location for the specified mime part.
  
      Params:
        contentLocation = content location
  */
  void setContentLocation(string contentLocation)
  {
    const(char)* _contentLocation = contentLocation.toCString(No.Alloc);
    g_mime_part_set_content_location(cast(GMimePart*)this._cPtr, _contentLocation);
  }

  /**
      Set the content md5 for the specified mime part.
  
      Params:
        contentMd5 = content md5 or null to generate the md5 digest.
  */
  void setContentMd5(string contentMd5)
  {
    const(char)* _contentMd5 = contentMd5.toCString(No.Alloc);
    g_mime_part_set_content_md5(cast(GMimePart*)this._cPtr, _contentMd5);
  }

  /**
      Sets the "filename" parameter on the Content-Disposition and also sets the
      "name" parameter on the Content-Type.
      
      Note: The filename string should be in UTF-8.
  
      Params:
        filename = the file name
  */
  void setFilename(string filename)
  {
    const(char)* _filename = filename.toCString(No.Alloc);
    g_mime_part_set_filename(cast(GMimePart*)this._cPtr, _filename);
  }

  /**
      Sets whether or not (and what type) of OpenPGP data is contained
      within the #GMimePart.
  
      Params:
        data = a #GMimeOpenPGPData
  */
  void setOpenpgpData(gmime.types.OpenPGPData data)
  {
    g_mime_part_set_openpgp_data(cast(GMimePart*)this._cPtr, data);
  }

  /**
      Verify the content md5 for the specified mime part.
      Returns: true if the md5 is valid or false otherwise. Note: will
        return false if the mime part does not contain a Content-MD5.
  */
  bool verifyContentMd5()
  {
    bool _retval;
    _retval = g_mime_part_verify_content_md5(cast(GMimePart*)this._cPtr);
    return _retval;
  }
}
