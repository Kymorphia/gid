/// Module for [Part] class
module gid.gmime3.part;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.data_wrapper;
import gid.gmime3.decrypt_result;
import gid.gmime3.object;
import gid.gmime3.signature_list;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A leaf-node MIME part object.
*/
class Part : gid.gmime3.object.ObjectWrap
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
    return cast(void function())g_mime_part_get_type != &gidSymbolNotFound ? g_mime_part_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimePart";
  }

  /** Returns `this`, for use in `with` statements. */
  override Part self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.part.Part]
      Returns: New builder object
  */
  static PartGidBuilder builder() nothrow
  {
    return new PartGidBuilder;
  }

  /**
      Creates a new MIME Part object with a default content-type of
      application/octet-stream.
      Returns: an empty MIME Part object with a default content-type of
        application/octet-stream.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimePart* _cretval;
      _cretval = g_mime_part_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new MIME Part with a sepcified type.
  
      Params:
        type = content-type string
        subtype = content-subtype string
      Returns: an empty MIME Part object with the specified content-type.
  */
  static gid.gmime3.part.Part newWithType(string type, string subtype) nothrow
  {
    GMimePart* _cretval;
    const(char)* _type = type.toCString!(No.Malloc, No.Nullable);
    const(char)* _subtype = subtype.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_part_new_with_type(_type, _subtype);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.part.Part)(cast(GMimePart*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the content on the mime part.
  
      Params:
        content = a #GMimeDataWrapper content object
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetContent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetContent(gid.gmime3.data_wrapper.DataWrapper content)
  {
    auto _klass = cast(GMimePartClass*)_vfuncClass;
    if (!_klass.setContent)
      return;

    _klass.setContent(cast(GMimePart*)this._cPtr, content ? cast(GMimeDataWrapper*)content._cPtr(No.Dup) : null);
  }

  /**
      Calculates the most efficient content encoding for the mime_part
      given the constraint.
  
      Params:
        constraint = a #GMimeEncodingConstraint
      Returns: the best content encoding for the specified mime part.
  */
  gid.gmime3.types.ContentEncoding getBestContentEncoding(gid.gmime3.types.EncodingConstraint constraint) nothrow
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_part_get_best_content_encoding(cast(GMimePart*)this._cPtr, constraint);
    gid.gmime3.types.ContentEncoding _retval = cast(gid.gmime3.types.ContentEncoding)_cretval;
    return _retval;
  }

  /**
      Gets the internal data-wrapper of the specified mime part, or null
      on error.
      Returns: the data-wrapper for the mime part's
        contents.
  */
  gid.gmime3.data_wrapper.DataWrapper getContent() nothrow
  {
    GMimeDataWrapper* _cretval;
    _cretval = g_mime_part_get_content(cast(GMimePart*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.data_wrapper.DataWrapper)(cast(GMimeDataWrapper*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the value of the Content-Description for the specified mime
      part if it exists or null otherwise.
      Returns: the content description for the specified mime part.
  */
  string getContentDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_description(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the content encoding of the mime part.
      Returns: the content encoding for the specified mime part.
  */
  gid.gmime3.types.ContentEncoding getContentEncoding() nothrow
  {
    GMimeContentEncoding _cretval;
    _cretval = g_mime_part_get_content_encoding(cast(GMimePart*)this._cPtr);
    gid.gmime3.types.ContentEncoding _retval = cast(gid.gmime3.types.ContentEncoding)_cretval;
    return _retval;
  }

  /**
      Gets the content-id of the specified mime part if it exists, or
      null otherwise.
      Returns: the content id for the specified mime part.
  */
  override string getContentId() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_id(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the value of the Content-Location header if it exists, or
      null otherwise.
      Returns: the content location for the specified mime part.
  */
  string getContentLocation() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_location(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the md5sum contained in the Content-Md5 header of the
      specified mime part if it exists, or null otherwise.
      Returns: the content md5 for the specified mime part.
  */
  string getContentMd5() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_content_md5(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the filename of the specificed mime part, or null if the
      mime_part does not have the filename or name parameter set.
      Returns: the filename of the specified mime_part or null if
        neither of the parameters is set. If a file name is set, the
        returned string will be in UTF-8.
  */
  string getFilename() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_part_get_filename(cast(GMimePart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether or not (and what type) of OpenPGP data is contained
      within the #GMimePart.
      Returns: a #GMimeOpenPGPData.
  */
  gid.gmime3.types.OpenPGPData getOpenpgpData() nothrow
  {
    GMimeOpenPGPData _cretval;
    _cretval = g_mime_part_get_openpgp_data(cast(GMimePart*)this._cPtr);
    gid.gmime3.types.OpenPGPData _retval = cast(gid.gmime3.types.OpenPGPData)_cretval;
    return _retval;
  }

  /**
      Determines whether or not the part is an attachment based on the
      value of the Content-Disposition header.
      Returns: true if the part is an attachment, otherwise false.
  */
  bool isAttachment() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_part_is_attachment(cast(GMimePart*)this._cPtr);
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
  gid.gmime3.decrypt_result.DecryptResult openpgpDecrypt(gid.gmime3.types.DecryptFlags flags, string sessionKey = null)
  {
    GMimeDecryptResult* _cretval;
    const(char)* _sessionKey = sessionKey.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = g_mime_part_openpgp_decrypt(cast(GMimePart*)this._cPtr, flags, _sessionKey, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.decrypt_result.DecryptResult)(cast(GMimeDecryptResult*)_cretval, Yes.Take);
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
  bool openpgpEncrypt(bool sign, string userid, gid.gmime3.types.EncryptFlags flags, string[] recipients)
  {
    bool _retval;
    const(char)* _userid = userid.toCString!(No.Malloc, Yes.Nullable);
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _retval = cast(bool)g_mime_part_openpgp_encrypt(cast(GMimePart*)this._cPtr, sign, _userid, flags, _recipients, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
    const(char)* _userid = userid.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)g_mime_part_openpgp_sign(cast(GMimePart*)this._cPtr, _userid, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  gid.gmime3.signature_list.SignatureList openpgpVerify(gid.gmime3.types.VerifyFlags flags)
  {
    GMimeSignatureList* _cretval;
    GError *_err;
    _cretval = g_mime_part_openpgp_verify(cast(GMimePart*)this._cPtr, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the content on the mime part.
  
      Params:
        content = a #GMimeDataWrapper content object
  */
  void setContent(gid.gmime3.data_wrapper.DataWrapper content) nothrow
  {
    g_mime_part_set_content(cast(GMimePart*)this._cPtr, content ? cast(GMimeDataWrapper*)content._cPtr(No.Dup) : null);
  }

  /**
      Set the content description for the specified mime part.
  
      Params:
        description = content description
  */
  void setContentDescription(string description) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    g_mime_part_set_content_description(cast(GMimePart*)this._cPtr, _description);
  }

  /**
      Set the content encoding for the specified mime part.
  
      Params:
        encoding = a #GMimeContentEncoding
  */
  void setContentEncoding(gid.gmime3.types.ContentEncoding encoding) nothrow
  {
    g_mime_part_set_content_encoding(cast(GMimePart*)this._cPtr, encoding);
  }

  /**
      Set the content id for the specified mime part.
  
      Params:
        contentId = content id
  */
  override void setContentId(string contentId) nothrow
  {
    const(char)* _contentId = contentId.toCString!(No.Malloc, No.Nullable);
    g_mime_part_set_content_id(cast(GMimePart*)this._cPtr, _contentId);
  }

  /**
      Set the content location for the specified mime part.
  
      Params:
        contentLocation = content location
  */
  void setContentLocation(string contentLocation) nothrow
  {
    const(char)* _contentLocation = contentLocation.toCString!(No.Malloc, No.Nullable);
    g_mime_part_set_content_location(cast(GMimePart*)this._cPtr, _contentLocation);
  }

  /**
      Set the content md5 for the specified mime part.
  
      Params:
        contentMd5 = content md5 or null to generate the md5 digest.
  */
  void setContentMd5(string contentMd5) nothrow
  {
    const(char)* _contentMd5 = contentMd5.toCString!(No.Malloc, No.Nullable);
    g_mime_part_set_content_md5(cast(GMimePart*)this._cPtr, _contentMd5);
  }

  /**
      Sets the "filename" parameter on the Content-Disposition and also sets the
      "name" parameter on the Content-Type.
      
      Note: The filename string should be in UTF-8.
  
      Params:
        filename = the file name
  */
  void setFilename(string filename) nothrow
  {
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    g_mime_part_set_filename(cast(GMimePart*)this._cPtr, _filename);
  }

  /**
      Sets whether or not (and what type) of OpenPGP data is contained
      within the #GMimePart.
  
      Params:
        data = a #GMimeOpenPGPData
  */
  void setOpenpgpData(gid.gmime3.types.OpenPGPData data) nothrow
  {
    g_mime_part_set_openpgp_data(cast(GMimePart*)this._cPtr, data);
  }

  /**
      Verify the content md5 for the specified mime part.
      Returns: true if the md5 is valid or false otherwise. Note: will
        return false if the mime part does not contain a Content-MD5.
  */
  bool verifyContentMd5() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_part_verify_content_md5(cast(GMimePart*)this._cPtr);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Part
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gmime3.part.Part), T.stringof ~ " is not derived from gid.gmime3.part.Part");

    gid.gmime3.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetContent", true)[0]) == gid.gmime3.part.Part))
      _installVfunc(klass, "set_content");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMimePartClass*)klass;

    switch (vfunc)
    {
      case "set_content":
      {
        static extern(C) void _vfuncSetContentTramp(GMimePart* mimePart, GMimeDataWrapper* content) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.part.Part)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)mimePart);
          if (!_obj)
          {
            auto _klass = cast(GMimePartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)mimePart);
            if (_klass.setContent)
              return (cast(typeof(&_vfuncSetContentTramp))_klass.setContent)(mimePart, content);
            return;
          }

          try
          {
            _obj.vfuncSetContent(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.data_wrapper.DataWrapper)(cast(void*)content, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.part.Part.vfuncSetContent");
          }
        }

        _klass.setContent = cast(typeof(_klass.setContent))&_vfuncSetContentTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.part.Part]
class PartGidBuilderImpl(T) : gid.gmime3.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.part.Part]
final class PartGidBuilder : PartGidBuilderImpl!PartGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Part build() nothrow
  {
    return new Part(cast(void*)createGObject(Part._getGType), Yes.Take);
  }
}
