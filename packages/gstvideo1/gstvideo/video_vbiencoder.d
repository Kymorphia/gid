/// Module for [VideoVBIEncoder] class
module gstvideo.video_vbiencoder;

import gid.gid;
import gobject.boxed;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    An encoder for writing ancillary data to the
    Vertical Blanking Interval lines of component signals.
*/
class VideoVBIEncoder : gobject.boxed.Boxed
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
    return cast(void function())gst_video_vbi_encoder_get_type != &gidSymbolNotFound ? gst_video_vbi_encoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoVBIEncoder self()
  {
    return this;
  }

  /**
      Create a new #GstVideoVBIEncoder for the specified format and pixel_width.
  
      Params:
        format = a #GstVideoFormat
        pixelWidth = The width in pixel to use
      Returns: The new #GstVideoVBIEncoder or null if the format and/or pixel_width
        is not supported.
  */
  this(gstvideo.types.VideoFormat format, uint pixelWidth)
  {
    GstVideoVBIEncoder* _cretval;
    _cretval = gst_video_vbi_encoder_new(format, pixelWidth);
    this(_cretval, Yes.Take);
  }

  /**
      Stores Video Ancillary data, according to SMPTE-291M specification.
      
      Note that the contents of the data are always read as 8bit data (i.e. do not contain
      the parity check bits).
  
      Params:
        composite = true if composite ADF should be created, component otherwise
        DID = The Data Identifier
        SDIDBlockNumber = The Secondary Data Identifier (if type 2) or the Data
                              Block Number (if type 1)
        data = The user data content of the Ancillary packet.
             Does not contain the ADF, DID, SDID nor CS.
      Returns: true if enough space was left in the current line, false
                 otherwise.
  */
  bool addAncillary(bool composite, ubyte DID, ubyte SDIDBlockNumber, ubyte[] data)
  {
    bool _retval;
    uint _dataCount;
    if (data)
      _dataCount = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_video_vbi_encoder_add_ancillary(cast(GstVideoVBIEncoder*)this._cPtr, composite, DID, SDIDBlockNumber, _data, _dataCount);
    return _retval;
  }

  /** */
  gstvideo.video_vbiencoder.VideoVBIEncoder copy()
  {
    GstVideoVBIEncoder* _cretval;
    _cretval = gst_video_vbi_encoder_copy(cast(const(GstVideoVBIEncoder)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_vbiencoder.VideoVBIEncoder(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
