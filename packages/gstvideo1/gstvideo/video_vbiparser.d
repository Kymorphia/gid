/// Module for [VideoVBIParser] class
module gstvideo.video_vbiparser;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;


import gstvideo.video_vbiencoder : _vbiLineSize;

/**
    A parser for detecting and extracting @GstVideoAncillary data from
    Vertical Blanking Interval lines of component signals.
*/
class VideoVBIParser : gobject.boxed.BoxedWrap!(gst_video_vbi_parser_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override VideoVBIParser self() nothrow
  {
    return this;
  }

  private uint _lineSize; // Line size in bytes from the format and pixel width, 0 if unknown

  /**
  Create a new #GstVideoVBIParser for the specified format and pixelWidth.
  
  Params:
  format = a #GstVideoFormat
  pixelWidth = The width in pixel to use
  */
  this(gstvideo.types.VideoFormat format, uint pixelWidth) nothrow
  {
    auto _cretval = gst_video_vbi_parser_new(cast(GstVideoFormat)format, pixelWidth);
    this(_cretval, Yes.Take);

    if (_cretval)
      _lineSize = _vbiLineSize(format, pixelWidth);
  }

  /**
  Copy the parser.
  Returns: a copy of the parser
  */
  gstvideo.video_vbiparser.VideoVBIParser copy() nothrow
  {
    auto _cretval = gst_video_vbi_parser_copy(cast(const(GstVideoVBIParser)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_vbiparser.VideoVBIParser(cast(void*)_cretval, Yes.Take) : null;

    if (_retval)
      _retval._lineSize = _lineSize;

    return _retval;
  }

  /**
  Get the size in bytes of a line of the format and pixel width the parser was created with.
  Returns: the line size in bytes, or 0 if unknown (the wrapper was not created with the constructor or copy)
  */
  @property uint lineSize() nothrow
  {
    return _lineSize;
  }

  /**
  Provide a new line of data to the parser. Call [gstvideo.video_vbiparser.VideoVBIParser.getAncillary] to get the
  Ancillary data that might be present on that line.
  Params:
  data = the line of data to parse, its length must be at least
  [gstvideo.video_vbiparser.VideoVBIParser.lineSize]
  */
  void addLine(ubyte[] data) nothrow
  {
    import glib.c.functions : g_log;
    import glib.c.types : GLogLevelFlags;

    if (_lineSize == 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiparser.VideoVBIParser.addLine line size unknown (not created with the constructor or copy)");
      return;
    }

    if (data.length < _lineSize)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gstvideo.video_vbiparser.VideoVBIParser.addLine data length %d is less than the line size %u",
      cast(int)data.length, _lineSize);
      return;
    }

    gst_video_vbi_parser_add_line(cast(GstVideoVBIParser*)this._cPtr, data.ptr);
  }

  /**
      Parse the line provided previously by [gstvideo.video_vbiparser.VideoVBIParser.addLine].
  
      Params:
        anc = a #GstVideoAncillary to start the eventual ancillary data
      Returns: [gstvideo.types.VideoVBIParserResult.Ok] if ancillary data was found and
        anc was filled. [gstvideo.types.VideoVBIParserResult.Done] if there wasn't any
        data.
  */
  gstvideo.types.VideoVBIParserResult getAncillary(out gstvideo.types.VideoAncillary anc) nothrow
  {
    GstVideoVBIParserResult _cretval;
    _cretval = gst_video_vbi_parser_get_ancillary(cast(GstVideoVBIParser*)this._cPtr, cast(GstVideoAncillary*)&anc);
    gstvideo.types.VideoVBIParserResult _retval = cast(gstvideo.types.VideoVBIParserResult)_cretval;
    return _retval;
  }
}
