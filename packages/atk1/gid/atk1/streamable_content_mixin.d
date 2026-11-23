/// Module for [StreamableContent] interface mixin
module gid.atk1.streamable_content_mixin;

public import gid.core.basictypes;
public import gid.atk1.streamable_content_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.glib2.iochannel;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface which provides access to streamable content.
    
    An interface whereby an object allows its backing content to be
    streamed to clients.  Typical implementors would be images or
    icons, HTML content, or multimedia display/rendering widgets.
    
    Negotiation of content type is allowed. Clients may examine the
    backing data and transform, convert, or parse the content in order
    to present it in an alternate form to end-users.
    
    The AtkStreamableContent interface is particularly useful for
    saving, printing, or post-processing entire documents, or for
    persisting alternate views of a document. If document content
    itself is being serialized, stored, or converted, then use of the
    AtkStreamableContent interface can help address performance
    issues. Unlike most ATK interfaces, this interface is not strongly
    tied to the current user-agent view of the a particular document,
    but may in some cases give access to the underlying model data.
*/
template StreamableContentT()
{

  /**
      Gets the character string of the specified mime type. The first mime
      type is at position 0, the second at position 1, and so on.
  
      Params:
        i = a gint representing the position of the mime type starting from 0
      Returns: a gchar* representing the specified mime type; the caller
        should not free the character string.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetMimeType`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetMimeType(int i)
  {
    auto _klass = cast(AtkStreamableContentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.streamable_content.StreamableContent._getGType);
    if (!_klass || !_klass.getMimeType)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getMimeType(cast(AtkStreamableContent*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of mime types supported by this object.
      Returns: a gint which is the number of mime types supported by the object.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNMimeTypes`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetNMimeTypes()
  {
    auto _klass = cast(AtkStreamableContentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.streamable_content.StreamableContent._getGType);
    if (!_klass || !_klass.getNMimeTypes)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNMimeTypes(cast(AtkStreamableContent*)this._cPtr);
    return _retval;
  }

  /**
      Gets the content in the specified mime type.
  
      Params:
        mimeType = a gchar* representing the mime type
      Returns: A #GIOChannel which contains the content in the
        specified mime type.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStream`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.iochannel.IOChannel vfuncGetStream(string mimeType)
  {
    auto _klass = cast(AtkStreamableContentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.streamable_content.StreamableContent._getGType);
    if (!_klass || !_klass.getStream)
      return typeof(return).init;

    GIOChannel* _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getStream(cast(AtkStreamableContent*)this._cPtr, _mimeType);
    auto _retval = _cretval ? new gid.glib2.iochannel.IOChannel(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get a string representing a URI in IETF standard format
      (see http://www.ietf.org/rfc/rfc2396.txt) from which the object's content
      may be streamed in the specified mime-type, if one is available.
      If mime_type is NULL, the URI for the default (and possibly only) mime-type is
      returned.
      
      Note that it is possible for get_uri to return NULL but for
      get_stream to work nonetheless, since not all GIOChannels connect to URIs.
  
      Params:
        mimeType = a gchar* representing the mime type, or NULL to request a URI
          for the default mime type.
      Returns: Returns a string representing a URI, or null
        if no corresponding URI can be constructed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetUri`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetUri(string mimeType)
  {
    auto _klass = cast(AtkStreamableContentIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.streamable_content.StreamableContent._getGType);
    if (!_klass || !_klass.getUri)
      return typeof(return).init;

    const(char)* _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getUri(cast(AtkStreamableContent*)this._cPtr, _mimeType);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the character string of the specified mime type. The first mime
      type is at position 0, the second at position 1, and so on.
  
      Params:
        i = a gint representing the position of the mime type starting from 0
      Returns: a gchar* representing the specified mime type; the caller
        should not free the character string.
  */
  override string getMimeType(int i) nothrow
  {
    const(char)* _cretval;
    _cretval = atk_streamable_content_get_mime_type(cast(AtkStreamableContent*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of mime types supported by this object.
      Returns: a gint which is the number of mime types supported by the object.
  */
  override int getNMimeTypes() nothrow
  {
    int _retval;
    _retval = atk_streamable_content_get_n_mime_types(cast(AtkStreamableContent*)this._cPtr);
    return _retval;
  }

  /**
      Gets the content in the specified mime type.
  
      Params:
        mimeType = a gchar* representing the mime type
      Returns: A #GIOChannel which contains the content in the
        specified mime type.
  */
  override gid.glib2.iochannel.IOChannel getStream(string mimeType) nothrow
  {
    GIOChannel* _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_streamable_content_get_stream(cast(AtkStreamableContent*)this._cPtr, _mimeType);
    auto _retval = _cretval ? new gid.glib2.iochannel.IOChannel(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get a string representing a URI in IETF standard format
      (see http://www.ietf.org/rfc/rfc2396.txt) from which the object's content
      may be streamed in the specified mime-type, if one is available.
      If mime_type is NULL, the URI for the default (and possibly only) mime-type is
      returned.
      
      Note that it is possible for get_uri to return NULL but for
      get_stream to work nonetheless, since not all GIOChannels connect to URIs.
  
      Params:
        mimeType = a gchar* representing the mime type, or NULL to request a URI
          for the default mime type.
      Returns: Returns a string representing a URI, or null
        if no corresponding URI can be constructed.
  */
  override string getUri(string mimeType) nothrow
  {
    const(char)* _cretval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    _cretval = atk_streamable_content_get_uri(cast(AtkStreamableContent*)this._cPtr, _mimeType);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.streamable_content.StreamableContent (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_streamable_content_StreamableContent(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMimeType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNMimeTypes", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStream", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUri", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.streamable_content.StreamableContent vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_streamable_content_StreamableContent(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetMimeType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.streamable_content.StreamableContent.vfuncGetMimeType is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNMimeTypes", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_streamable_content_StreamableContent(iface, "get_n_mime_types");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStream", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_streamable_content_StreamableContent(iface, "get_stream");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.streamable_content.StreamableContent.vfuncGetUri is not supported: callback string return value with transfer none is not supported");
  }

  private static void _installIfaceVfunc_gid_atk1_streamable_content_StreamableContent(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkStreamableContentIface*)iface;

    switch (vfunc)
    {
      case "get_n_mime_types":
      {
        static extern(C) int _vfuncGetNMimeTypesTramp(AtkStreamableContent* streamable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)streamable);
          if (!_obj)
          {
            auto _klass = cast(AtkStreamableContentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)streamable), gid.atk1.streamable_content.StreamableContent._getGType);
            if (_klass && _klass.getNMimeTypes)
              return (cast(typeof(&_vfuncGetNMimeTypesTramp))_klass.getNMimeTypes)(streamable);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNMimeTypes();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.streamable_content.StreamableContent.vfuncGetNMimeTypes");
          }
          return _retval;
        }

        _klass.getNMimeTypes = cast(typeof(_klass.getNMimeTypes))&_vfuncGetNMimeTypesTramp;
        break;
      }
      case "get_stream":
      {
        static extern(C) GIOChannel* _vfuncGetStreamTramp(AtkStreamableContent* streamable, const(char)* mimeType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)streamable);
          if (!_obj)
          {
            auto _klass = cast(AtkStreamableContentIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)streamable), gid.atk1.streamable_content.StreamableContent._getGType);
            if (_klass && _klass.getStream)
              return (cast(typeof(&_vfuncGetStreamTramp))_klass.getStream)(streamable, mimeType);
            return typeof(return).init;
          }

          gid.glib2.iochannel.IOChannel _dretval;
          string _mimeType = mimeType.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetStream(_mimeType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.streamable_content.StreamableContent.vfuncGetStream");
          }
          auto _retval = _dretval ? cast(GIOChannel*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getStream = cast(typeof(_klass.getStream))&_vfuncGetStreamTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.streamable_content.StreamableContent]
template StreamableContentGidBuilderT()
{
}
