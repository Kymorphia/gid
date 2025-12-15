/// Module for [RTPHeaderExtension] class
module gstrtp.rtpheader_extension;

import gid.gid;
import gobject.object;
import gst.buffer;
import gst.caps;
import gst.element;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.types;

/**
    Instance struct for a RTP Audio/Video header extension.
*/
class RTPHeaderExtension : gst.element.Element
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
    return cast(void function())gst_rtp_header_extension_get_type != &gidSymbolNotFound ? gst_rtp_header_extension_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RTPHeaderExtension self()
  {
    return this;
  }

  /** */
  static gstrtp.rtpheader_extension.RTPHeaderExtension createFromUri(string uri)
  {
    GstRTPHeaderExtension* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_rtp_header_extension_create_from_uri(_uri);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstrtp.rtpheader_extension.RTPHeaderExtension)(cast(GstRTPHeaderExtension*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieve the direction
      Returns: The direction
  */
  gstrtp.types.RTPHeaderExtensionDirection getDirection()
  {
    GstRTPHeaderExtensionDirection _cretval;
    _cretval = gst_rtp_header_extension_get_direction(cast(GstRTPHeaderExtension*)this._cPtr);
    gstrtp.types.RTPHeaderExtensionDirection _retval = cast(gstrtp.types.RTPHeaderExtensionDirection)_cretval;
    return _retval;
  }

  /** */
  uint getId()
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
  size_t getMaxSize(gst.buffer.Buffer inputMeta)
  {
    size_t _retval;
    _retval = gst_rtp_header_extension_get_max_size(cast(GstRTPHeaderExtension*)this._cPtr, inputMeta ? cast(const(GstBuffer)*)inputMeta._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  string getSdpCapsFieldName()
  {
    char* _cretval;
    _cretval = gst_rtp_header_extension_get_sdp_caps_field_name(cast(GstRTPHeaderExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  gstrtp.types.RTPHeaderExtensionFlags getSupportedFlags()
  {
    GstRTPHeaderExtensionFlags _cretval;
    _cretval = gst_rtp_header_extension_get_supported_flags(cast(GstRTPHeaderExtension*)this._cPtr);
    gstrtp.types.RTPHeaderExtensionFlags _retval = cast(gstrtp.types.RTPHeaderExtensionFlags)_cretval;
    return _retval;
  }

  /** */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gst_rtp_header_extension_get_uri(cast(GstRTPHeaderExtension*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  bool read(gstrtp.types.RTPHeaderExtensionFlags readFlags, ubyte[] data, gst.buffer.Buffer buffer)
  {
    bool _retval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_rtp_header_extension_read(cast(GstRTPHeaderExtension*)this._cPtr, readFlags, _data, _size, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      [gstrtp.rtpheader_extension.RTPHeaderExtension.setId] must have been called with a valid
      extension id that is contained in these caps.
      
      The only current known caps format is based on the SDP standard as produced
      by [gstsdp.sdpmedia.SDPMedia.attributesToCaps].
  
      Params:
        caps = the #GstCaps to configure this extension with
      Returns: whether the caps could be successfully set on ext.
  */
  bool setAttributesFromCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_set_attributes_from_caps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      [gstrtp.rtpheader_extension.RTPHeaderExtension.setId] must have been called with a valid
      extension id that is contained in these caps.
      
      The only current known caps format is based on the SDP standard as produced
      by [gstsdp.sdpmedia.SDPMedia.attributesToCaps].
  
      Params:
        caps = writable #GstCaps to modify
      Returns: whether the configured attributes on ext can successfully be set on
        	caps
  */
  bool setCapsFromAttributes(gst.caps.Caps caps)
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
  bool setCapsFromAttributesHelper(gst.caps.Caps caps, string attributes)
  {
    bool _retval;
    const(char)* _attributes = attributes.toCString(No.Alloc);
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
  void setDirection(gstrtp.types.RTPHeaderExtensionDirection direction)
  {
    gst_rtp_header_extension_set_direction(cast(GstRTPHeaderExtension*)this._cPtr, direction);
  }

  /**
      sets the RTP extension id on ext
  
      Params:
        extId = The id of this extension
  */
  void setId(uint extId)
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
  bool setNonRtpSinkCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_set_non_rtp_sink_caps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Call this function in a subclass from #GstRTPHeaderExtensionClass::read to
      tell the depayloader whether the data just parsed from RTP packet require
      updating its src (non-RTP) caps. If state is TRUE, #GstRTPBaseDepayload will
      eventually invoke [gstrtp.rtpheader_extension.RTPHeaderExtension.updateNonRtpSrcCaps] to
      have the caps update applied. Applying the update also flips the internal
      "wants update" flag back to FALSE.
  
      Params:
        state = TRUE if caps update is needed
  */
  void setWantsUpdateNonRtpSrcCaps(bool state)
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
  bool updateNonRtpSrcCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_update_non_rtp_src_caps(cast(GstRTPHeaderExtension*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Call this function after [gstrtp.rtpheader_extension.RTPHeaderExtension.read] to check if
      the depayloader's src caps need updating with data received in the last RTP
      packet.
      Returns: Whether ext wants to update depayloader's src caps.
  */
  bool wantsUpdateNonRtpSrcCaps()
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_header_extension_wants_update_non_rtp_src_caps(cast(GstRTPHeaderExtension*)this._cPtr);
    return _retval;
  }

  /**
      Writes the RTP header extension to data using information available from
      the input_meta.  data will be sized to be at least the value returned
      from [gstrtp.rtpheader_extension.RTPHeaderExtension.getMaxSize].
  
      Params:
        inputMeta = the input #GstBuffer to read information from if necessary
        writeFlags = #GstRTPHeaderExtensionFlags for how the extension should
                        be written
        output = output RTP #GstBuffer
        data = location to write the rtp header extension into
      Returns: the size of the data written, < 0 on failure
  */
  ptrdiff_t write(gst.buffer.Buffer inputMeta, gstrtp.types.RTPHeaderExtensionFlags writeFlags, gst.buffer.Buffer output, ubyte[] data)
  {
    ptrdiff_t _retval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = gst_rtp_header_extension_write(cast(GstRTPHeaderExtension*)this._cPtr, inputMeta ? cast(const(GstBuffer)*)inputMeta._cPtr(No.Dup) : null, writeFlags, output ? cast(GstBuffer*)output._cPtr(No.Dup) : null, _data, _size);
    return _retval;
  }
}
