/// Module for [VideoVBIEncoder] class
module gstvideo.video_vbiencoder;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;


package uint _vbiLineSize(gstvideo.types.VideoFormat format, uint pixelWidth) nothrow
{
  auto info = gst_video_info_new();
  scope(exit) gst_video_info_free(info);

  if (!gst_video_info_set_format(info, cast(GstVideoFormat)format, pixelWidth, 1) || info.stride[0] <= 0)
    return 0;

  return cast(uint)info.stride[0];
}

/**
    An encoder for writing ancillary data to the
    Vertical Blanking Interval lines of component signals.
*/
class VideoVBIEncoder : gobject.boxed.BoxedWrap!(gst_video_vbi_encoder_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoVBIEncoder self() nothrow
  {
    return this;
  }

  private uint _lineSize; // Line size in bytes from the format and pixel width, 0 if unknown

  /**
  Create a new #GstVideoVBIEncoder for the specified format and pixelWidth.
  
  Params:
  format = a #GstVideoFormat
  pixelWidth = The width in pixel to use
  */
  this(gstvideo.types.VideoFormat format, uint pixelWidth) nothrow
  {
    auto _cretval = gst_video_vbi_encoder_new(cast(GstVideoFormat)format, pixelWidth);
    this(_cretval, Yes.Take);

    if (_cretval)
      _lineSize = _vbiLineSize(format, pixelWidth);
  }

  /**
  Copy the encoder.
  Returns: a copy of the encoder
  */
  gstvideo.video_vbiencoder.VideoVBIEncoder copy() nothrow
  {
    auto _cretval = gst_video_vbi_encoder_copy(cast(const(GstVideoVBIEncoder)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_vbiencoder.VideoVBIEncoder(cast(void*)_cretval, Yes.Take) : null;

    if (_retval)
      _retval._lineSize = _lineSize;

    return _retval;
  }

  /**
  Get the size in bytes of a line of the format and pixel width the encoder was created with.
  Returns: the line size in bytes, or 0 if unknown (the wrapper was not created with the constructor or copy)
  */
  @property uint lineSize() nothrow
  {
    return _lineSize;
  }

  /**
  Write the pending ancillary data as a line of the format and pixel width the encoder was created with.
  Params:
  data = the line to write to, its length must be at least [gstvideo.video_vbiencoder.VideoVBIEncoder.lineSize]
  */
  void writeLine(ubyte[] data) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    if (_lineSize == 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiencoder.VideoVBIEncoder.writeLine line size unknown (not created with the constructor or copy)");
      return;
    }

    if (data.length < _lineSize)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiencoder.VideoVBIEncoder.writeLine data length %d is less than the line size %u",
      cast(int)data.length, _lineSize);
      return;
    }

    gst_video_vbi_encoder_write_line(cast(GstVideoVBIEncoder*)this._cPtr, data.ptr);
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
  bool addAncillary(bool composite, ubyte DID, ubyte SDIDBlockNumber, ubyte[] data) nothrow
  {
    bool _retval;
    uint _dataCount;
    if (data)
      _dataCount = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = cast(bool)gst_video_vbi_encoder_add_ancillary(cast(GstVideoVBIEncoder*)this._cPtr, composite, DID, SDIDBlockNumber, _data, _dataCount);
    return _retval;
  }
}
