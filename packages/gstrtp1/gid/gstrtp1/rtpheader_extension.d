/// Module for [RTPHeaderExtension] class
module gid.gstrtp1.rtpheader_extension;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.element;
import gid.gstrtp1.c.functions;
import gid.gstrtp1.c.types;
import gid.gstrtp1.types;

/**
    Instance struct for a RTP Audio/Video header extension.
*/
class RTPHeaderExtension : gid.gst1.element.Element
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_rtp_header_extension_get_type != &gidSymbolNotFound ? gst_rtp_header_extension_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstRTPHeaderExtension";
  }

  /** Returns `this`, for use in `with` statements. */
  override RTPHeaderExtension self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension]
      Returns: New builder object
  */
  static RTPHeaderExtensionGidBuilder builder() nothrow
  {
    return new RTPHeaderExtensionGidBuilder;
  }

  /** */
  static gid.gstrtp1.rtpheader_extension.RTPHeaderExtension createFromUri(string uri) nothrow
  {
    GstRTPHeaderExtension* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtp_header_extension_create_from_uri(_uri);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)(cast(GstRTPHeaderExtension*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is used to know how much data a certain header extension will need for
      both allocating the resulting data, and deciding how much payload data can
      be generated.
      
      Implementations should return as accurate a value as is possible using the
      information given in the input buffer.
  
      Params:
        inputMeta = a #GstBuffer
      Returns: the maximum size of the data written by this extension
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetMaxSize` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected size_t vfuncGetMaxSize(gid.gst1.buffer.Buffer inputMeta)
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.getMaxSize)
      return typeof(return).init;

    size_t _retval;
    _retval = _klass.getMaxSize(cast(GstRTPHeaderExtension*)this._cPtr, inputMeta ? cast(const(GstBuffer)*)inputMeta._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      retrieve the supported flags
      Returns: the flags supported by this instance of ext
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetSupportedFlags` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gstrtp1.types.RTPHeaderExtensionFlags vfuncGetSupportedFlags()
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.getSupportedFlags)
      return typeof(return).init;

    GstRTPHeaderExtensionFlags _cretval;
    _cretval = _klass.getSupportedFlags(cast(GstRTPHeaderExtension*)this._cPtr);
    gid.gstrtp1.types.RTPHeaderExtensionFlags _retval = cast(gid.gstrtp1.types.RTPHeaderExtensionFlags)_cretval;
    return _retval;
  }

  /**
      Read the RTP header extension from data.
  
      Params:
        readFlags = #GstRTPHeaderExtensionFlags for how the extension should
                        be written
        data = location to read the rtp header extension from
        buffer = a #GstBuffer to modify if necessary (modified in place, changes are seen by the caller)
      Returns: whether the extension could be read from data
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRead` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncRead(gid.gstrtp1.types.RTPHeaderExtensionFlags readFlags, ubyte[] data, gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.read)
      return typeof(return).init;

    bool _retval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = cast(bool)_klass.read(cast(GstRTPHeaderExtension*)this._cPtr, readFlags, _data, _size, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      set the necessary attributes that may be signaled e.g. with
          an SDP.
  
      Params:
        direction = 
        attributes = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetAttributes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetAttributes(gid.gstrtp1.types.RTPHeaderExtensionDirection direction, string attributes)
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.setAttributes)
      return typeof(return).init;

    bool _retval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.setAttributes(cast(GstRTPHeaderExtension*)this._cPtr, direction, _attributes);
    return _retval;
  }

  /**
      [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.setId] must have been called with a valid
      extension id that is contained in these caps.
      
      The only current known caps format is based on the SDP standard as produced
      by [gid.gstsdp1.sdpmedia.SDPMedia.attributesToCaps].
  
      Params:
        caps = writable #GstCaps to modify (modified in place, changes are seen by the caller)
      Returns: whether the configured attributes on ext can successfully be set on
        	caps
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetCapsFromAttributes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetCapsFromAttributes(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.setCapsFromAttributes)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setCapsFromAttributes(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Passes RTP payloader's sink (i.e. not payloaded) caps to the header
      extension.
  
      Params:
        caps = sink #GstCaps
      Returns: Whether caps could be read successfully
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetNonRtpSinkCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncSetNonRtpSinkCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.setNonRtpSinkCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setNonRtpSinkCaps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Updates depayloader src caps based on the information received in RTP header.
      caps must be writable as this function may modify them.
  
      Params:
        caps = src #GstCaps to modify (modified in place, changes are seen by the caller)
      Returns: whether caps were modified successfully
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUpdateNonRtpSrcCaps` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncUpdateNonRtpSrcCaps(gid.gst1.caps.Caps caps)
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.updateNonRtpSrcCaps)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.updateNonRtpSrcCaps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Writes the RTP header extension to data using information available from
      the input_meta.  data will be sized to be at least the value returned
      from [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.getMaxSize].
  
      Params:
        inputMeta = the input #GstBuffer to read information from if necessary
        writeFlags = #GstRTPHeaderExtensionFlags for how the extension should
                        be written
        output = output RTP #GstBuffer (modified in place, changes are seen by the caller)
        data = location to write the rtp header extension into
      Returns: the size of the data written, < 0 on failure
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWrite` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected ptrdiff_t vfuncWrite(gid.gst1.buffer.Buffer inputMeta, gid.gstrtp1.types.RTPHeaderExtensionFlags writeFlags, gid.gst1.buffer.Buffer output, ubyte[] data)
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)_vfuncClass;
    if (!_klass.write)
      return typeof(return).init;

    ptrdiff_t _retval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = _klass.write(cast(GstRTPHeaderExtension*)this._cPtr, inputMeta ? cast(const(GstBuffer)*)inputMeta._cPtr(No.Dup) : null, writeFlags, output ? cast(GstBuffer*)output._cPtr(No.Dup) : null, _data, _size);
    return _retval;
  }

  /**
      Retrieve the direction
      Returns: The direction
  */
  gid.gstrtp1.types.RTPHeaderExtensionDirection getDirection() nothrow
  {
    GstRTPHeaderExtensionDirection _cretval;
    _cretval = gst_rtp_header_extension_get_direction(cast(GstRTPHeaderExtension*)this._cPtr);
    gid.gstrtp1.types.RTPHeaderExtensionDirection _retval = cast(gid.gstrtp1.types.RTPHeaderExtensionDirection)_cretval;
    return _retval;
  }

  /** */
  uint getId() nothrow
  {
    uint _retval;
    _retval = gst_rtp_header_extension_get_id(cast(GstRTPHeaderExtension*)this._cPtr);
    return _retval;
  }

  /**
      This is used to know how much data a certain header extension will need for
      both allocating the resulting data, and deciding how much payload data can
      be generated.
      
      Implementations should return as accurate a value as is possible using the
      information given in the input buffer.
  
      Params:
        inputMeta = a #GstBuffer
      Returns: the maximum size of the data written by this extension
  */
  size_t getMaxSize(gid.gst1.buffer.Buffer inputMeta) nothrow
  {
    size_t _retval;
    _retval = gst_rtp_header_extension_get_max_size(cast(GstRTPHeaderExtension*)this._cPtr, inputMeta ? cast(const(GstBuffer)*)inputMeta._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string getSdpCapsFieldName() nothrow
  {
    char* _cretval;
    _cretval = gst_rtp_header_extension_get_sdp_caps_field_name(cast(GstRTPHeaderExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  gid.gstrtp1.types.RTPHeaderExtensionFlags getSupportedFlags() nothrow
  {
    GstRTPHeaderExtensionFlags _cretval;
    _cretval = gst_rtp_header_extension_get_supported_flags(cast(GstRTPHeaderExtension*)this._cPtr);
    gid.gstrtp1.types.RTPHeaderExtensionFlags _retval = cast(gid.gstrtp1.types.RTPHeaderExtensionFlags)_cretval;
    return _retval;
  }

  /** */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_rtp_header_extension_get_uri(cast(GstRTPHeaderExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Read the RTP header extension from data.
  
      Params:
        readFlags = #GstRTPHeaderExtensionFlags for how the extension should
                        be written
        data = location to read the rtp header extension from
        buffer = a #GstBuffer to modify if necessary
      Returns: whether the extension could be read from data
  */
  bool read(gid.gstrtp1.types.RTPHeaderExtensionFlags readFlags, ubyte[] data, gid.gst1.buffer.Buffer buffer) nothrow
  {
    bool _retval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = cast(bool)gst_rtp_header_extension_read(cast(GstRTPHeaderExtension*)this._cPtr, readFlags, _data, _size, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.setId] must have been called with a valid
      extension id that is contained in these caps.
      
      The only current known caps format is based on the SDP standard as produced
      by [gid.gstsdp1.sdpmedia.SDPMedia.attributesToCaps].
  
      Params:
        caps = the #GstCaps to configure this extension with
      Returns: whether the caps could be successfully set on ext.
  */
  bool setAttributesFromCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_set_attributes_from_caps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.setId] must have been called with a valid
      extension id that is contained in these caps.
      
      The only current known caps format is based on the SDP standard as produced
      by [gid.gstsdp1.sdpmedia.SDPMedia.attributesToCaps].
  
      Params:
        caps = writable #GstCaps to modify
      Returns: whether the configured attributes on ext can successfully be set on
        	caps
  */
  bool setCapsFromAttributes(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_set_caps_from_attributes(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Helper implementation for GstRTPExtensionClass::set_caps_from_attributes
      that sets the ext uri on caps with the specified extension id as required
      for sdp #GstCaps.
      
      Requires that the extension does not have any attributes or direction
      advertised in caps.
  
      Params:
        caps = #GstCaps to write fields into
        attributes = 
      Returns: whether the ext attributes could be set on caps.
  */
  bool setCapsFromAttributesHelper(gid.gst1.caps.Caps caps, string attributes) nothrow
  {
    bool _retval;
    const(char)* _attributes = attributes.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_rtp_header_extension_set_caps_from_attributes_helper(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, _attributes);
    return _retval;
  }

  /**
      Set the direction that this header extension should be used in.
      If #GST_RTP_HEADER_EXTENSION_DIRECTION_INHERITED is included, the
      direction will not be included in the caps (as it shouldn't be in the
      extmap line in the SDP).
  
      Params:
        direction = The direction
  */
  void setDirection(gid.gstrtp1.types.RTPHeaderExtensionDirection direction) nothrow
  {
    gst_rtp_header_extension_set_direction(cast(GstRTPHeaderExtension*)this._cPtr, direction);
  }

  /**
      sets the RTP extension id on ext
  
      Params:
        extId = The id of this extension
  */
  void setId(uint extId) nothrow
  {
    gst_rtp_header_extension_set_id(cast(GstRTPHeaderExtension*)this._cPtr, extId);
  }

  /**
      Passes RTP payloader's sink (i.e. not payloaded) caps to the header
      extension.
  
      Params:
        caps = sink #GstCaps
      Returns: Whether caps could be read successfully
  */
  bool setNonRtpSinkCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_set_non_rtp_sink_caps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Call this function in a subclass from #GstRTPHeaderExtensionClass::read to
      tell the depayloader whether the data just parsed from RTP packet require
      updating its src (non-RTP) caps. If state is TRUE, #GstRTPBaseDepayload will
      eventually invoke [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.updateNonRtpSrcCaps] to
      have the caps update applied. Applying the update also flips the internal
      "wants update" flag back to FALSE.
  
      Params:
        state = TRUE if caps update is needed
  */
  void setWantsUpdateNonRtpSrcCaps(bool state) nothrow
  {
    gst_rtp_header_extension_set_wants_update_non_rtp_src_caps(cast(GstRTPHeaderExtension*)this._cPtr, state);
  }

  /**
      Updates depayloader src caps based on the information received in RTP header.
      caps must be writable as this function may modify them.
  
      Params:
        caps = src #GstCaps to modify
      Returns: whether caps were modified successfully
  */
  bool updateNonRtpSrcCaps(gid.gst1.caps.Caps caps) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_update_non_rtp_src_caps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Call this function after [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.read] to check if
      the depayloader's src caps need updating with data received in the last RTP
      packet.
      Returns: Whether ext wants to update depayloader's src caps.
  */
  bool wantsUpdateNonRtpSrcCaps() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_wants_update_non_rtp_src_caps(cast(GstRTPHeaderExtension*)this._cPtr);
    return _retval;
  }

  /**
      Writes the RTP header extension to data using information available from
      the input_meta.  data will be sized to be at least the value returned
      from [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.getMaxSize].
  
      Params:
        inputMeta = the input #GstBuffer to read information from if necessary
        writeFlags = #GstRTPHeaderExtensionFlags for how the extension should
                        be written
        output = output RTP #GstBuffer
        data = location to write the rtp header extension into
      Returns: the size of the data written, < 0 on failure
  */
  ptrdiff_t write(gid.gst1.buffer.Buffer inputMeta, gid.gstrtp1.types.RTPHeaderExtensionFlags writeFlags, gid.gst1.buffer.Buffer output, ubyte[] data) nothrow
  {
    ptrdiff_t _retval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = gst_rtp_header_extension_write(cast(GstRTPHeaderExtension*)this._cPtr, inputMeta ? cast(const(GstBuffer)*)inputMeta._cPtr(No.Dup) : null, writeFlags, output ? cast(GstBuffer*)output._cPtr(No.Dup) : null, _data, _size);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RTPHeaderExtension
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gstrtp1.rtpheader_extension.RTPHeaderExtension), T.stringof ~ " is not derived from gid.gstrtp1.rtpheader_extension.RTPHeaderExtension");

    gid.gst1.element.Element._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetMaxSize", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "get_max_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetSupportedFlags", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "get_supported_flags");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRead", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "read");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetAttributes", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "set_attributes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetCapsFromAttributes", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "set_caps_from_attributes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetNonRtpSinkCaps", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "set_non_rtp_sink_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUpdateNonRtpSrcCaps", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "update_non_rtp_src_caps");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWrite", true)[0]) == gid.gstrtp1.rtpheader_extension.RTPHeaderExtension))
      _installVfunc(klass, "write");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstRTPHeaderExtensionClass*)klass;

    switch (vfunc)
    {
      case "get_max_size":
      {
        static extern(C) size_t _vfuncGetMaxSizeTramp(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.getMaxSize)
              return (cast(typeof(&_vfuncGetMaxSizeTramp))_klass.getMaxSize)(ext, inputMeta);
            return typeof(return).init;
          }

          size_t _retval;

          try
          {
            _retval = _obj.vfuncGetMaxSize(inputMeta ? new gid.gst1.buffer.Buffer(cast(void*)inputMeta, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncGetMaxSize");
          }
          return _retval;
        }

        _klass.getMaxSize = cast(typeof(_klass.getMaxSize))&_vfuncGetMaxSizeTramp;
        break;
      }
      case "get_supported_flags":
      {
        static extern(C) GstRTPHeaderExtensionFlags _vfuncGetSupportedFlagsTramp(GstRTPHeaderExtension* ext) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.getSupportedFlags)
              return (cast(typeof(&_vfuncGetSupportedFlagsTramp))_klass.getSupportedFlags)(ext);
            return typeof(return).init;
          }

          gid.gstrtp1.types.RTPHeaderExtensionFlags _dretval;

          try
          {
            _dretval = _obj.vfuncGetSupportedFlags();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncGetSupportedFlags");
          }
          auto _retval = cast(GstRTPHeaderExtensionFlags)_dretval;

          return _retval;
        }

        _klass.getSupportedFlags = cast(typeof(_klass.getSupportedFlags))&_vfuncGetSupportedFlagsTramp;
        break;
      }
      case "read":
      {
        static extern(C) gboolean _vfuncReadTramp(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionFlags readFlags, const(ubyte)* data, size_t size, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.read)
              return (cast(typeof(&_vfuncReadTramp))_klass.read)(ext, readFlags, data, size, buffer);
            return typeof(return).init;
          }

          bool _dretval;
          ubyte[] _data;
          _data.length = size;
          _data[0 .. size] = data[0 .. size];
          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncRead(readFlags, _data, _buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncRead");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_buffer)
            _buffer._cUnborrow;

          return _retval;
        }

        _klass.read = cast(typeof(_klass.read))&_vfuncReadTramp;
        break;
      }
      case "set_attributes":
      {
        static extern(C) gboolean _vfuncSetAttributesTramp(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionDirection direction, const(char)* attributes) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.setAttributes)
              return (cast(typeof(&_vfuncSetAttributesTramp))_klass.setAttributes)(ext, direction, attributes);
            return typeof(return).init;
          }

          bool _dretval;
          string _attributes = attributes.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetAttributes(direction, _attributes);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncSetAttributes");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setAttributes = cast(typeof(_klass.setAttributes))&_vfuncSetAttributesTramp;
        break;
      }
      case "set_caps_from_attributes":
      {
        static extern(C) gboolean _vfuncSetCapsFromAttributesTramp(GstRTPHeaderExtension* ext, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.setCapsFromAttributes)
              return (cast(typeof(&_vfuncSetCapsFromAttributesTramp))_klass.setCapsFromAttributes)(ext, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncSetCapsFromAttributes(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncSetCapsFromAttributes");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.setCapsFromAttributes = cast(typeof(_klass.setCapsFromAttributes))&_vfuncSetCapsFromAttributesTramp;
        break;
      }
      case "set_non_rtp_sink_caps":
      {
        static extern(C) gboolean _vfuncSetNonRtpSinkCapsTramp(GstRTPHeaderExtension* ext, const(GstCaps)* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.setNonRtpSinkCaps)
              return (cast(typeof(&_vfuncSetNonRtpSinkCapsTramp))_klass.setNonRtpSinkCaps)(ext, caps);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetNonRtpSinkCaps(caps ? new gid.gst1.caps.Caps(cast(void*)caps, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncSetNonRtpSinkCaps");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setNonRtpSinkCaps = cast(typeof(_klass.setNonRtpSinkCaps))&_vfuncSetNonRtpSinkCapsTramp;
        break;
      }
      case "update_non_rtp_src_caps":
      {
        static extern(C) gboolean _vfuncUpdateNonRtpSrcCapsTramp(GstRTPHeaderExtension* ext, GstCaps* caps) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.updateNonRtpSrcCaps)
              return (cast(typeof(&_vfuncUpdateNonRtpSrcCapsTramp))_klass.updateNonRtpSrcCaps)(ext, caps);
            return typeof(return).init;
          }

          bool _dretval;
          auto _caps = caps ? new gid.gst1.caps.Caps(cast(void*)caps, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncUpdateNonRtpSrcCaps(_caps);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncUpdateNonRtpSrcCaps");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_caps)
            _caps._cUnborrow;

          return _retval;
        }

        _klass.updateNonRtpSrcCaps = cast(typeof(_klass.updateNonRtpSrcCaps))&_vfuncUpdateNonRtpSrcCapsTramp;
        break;
      }
      case "write":
      {
        static extern(C) ptrdiff_t _vfuncWriteTramp(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta, GstRTPHeaderExtensionFlags writeFlags, GstBuffer* output, ubyte* data, size_t size) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gstrtp1.rtpheader_extension.RTPHeaderExtension)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)ext);
          if (!_obj)
          {
            auto _klass = cast(GstRTPHeaderExtensionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)ext);
            if (_klass.write)
              return (cast(typeof(&_vfuncWriteTramp))_klass.write)(ext, inputMeta, writeFlags, output, data, size);
            return typeof(return).init;
          }

          ptrdiff_t _retval;
          auto _output = output ? new gid.gst1.buffer.Buffer(cast(void*)output, Yes.Take)._cBorrow : null;
          ubyte[] _data;
          _data.length = size;
          _data[0 .. size] = data[0 .. size];

          try
          {
            _retval = _obj.vfuncWrite(inputMeta ? new gid.gst1.buffer.Buffer(cast(void*)inputMeta, No.Take) : null, writeFlags, _output, _data);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gstrtp1.rtpheader_extension.RTPHeaderExtension.vfuncWrite");
          }
          if (_output)
            _output._cUnborrow;

          return _retval;
        }

        _klass.write = cast(typeof(_klass.write))&_vfuncWriteTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension]
class RTPHeaderExtensionGidBuilderImpl(T) : gid.gst1.element.ElementGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gstrtp1.rtpheader_extension.RTPHeaderExtension]
final class RTPHeaderExtensionGidBuilder : RTPHeaderExtensionGidBuilderImpl!RTPHeaderExtensionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RTPHeaderExtension build() nothrow
  {
    return new RTPHeaderExtension(cast(void*)createGObject(RTPHeaderExtension._getGType), Yes.Take);
  }
}
