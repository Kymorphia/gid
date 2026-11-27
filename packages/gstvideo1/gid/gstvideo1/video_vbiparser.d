/// Module for [VideoVBIParser] class
module gid.gstvideo1.video_vbiparser;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;


import gid.gstvideo1.video_vbiencoder : _vbiLineSize;

/**
    A parser for detecting and extracting @GstVideoAncillary data from
    Vertical Blanking Interval lines of component signals.
*/
@gidGir("VideoVBIParser")
class VideoVBIParser : gid.gobject2.boxed.BoxedWrap!(gst_video_vbi_parser_get_type)
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
  this(gid.gstvideo1.types.VideoFormat format, uint pixelWidth) nothrow
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
  gid.gstvideo1.video_vbiparser.VideoVBIParser copy() nothrow
  {
    auto _cretval = gst_video_vbi_parser_copy(cast(const(GstVideoVBIParser)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstvideo1.video_vbiparser.VideoVBIParser(cast(void*)_cretval, Yes.Take) : null;

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
  Provide a new line of data to the parser. Call [gid.gstvideo1.video_vbiparser.VideoVBIParser.getAncillary] to get the
  Ancillary data that might be present on that line.
  Params:
  data = the line of data to parse, its length must be at least
  [gid.gstvideo1.video_vbiparser.VideoVBIParser.lineSize]
  */
  void addLine(ubyte[] data) nothrow
  {
    import gid.glib2.c.functions : g_log;
    import gid.glib2.c.types : GLogLevelFlags;

    if (_lineSize == 0)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gid.gstvideo1.video_vbiparser.VideoVBIParser.addLine line size unknown (not created with the constructor or copy)");
      return;
    }

    if (data.length < _lineSize)
    {
      g_log("Gid", GLogLevelFlags.LevelCritical, "gid.gstvideo1.video_vbiparser.VideoVBIParser.addLine data length %d is less than the line size %u",
      cast(int)data.length, _lineSize);
      return;
    }

    gst_video_vbi_parser_add_line(cast(GstVideoVBIParser*)this._cPtr, data.ptr);
  }

  /**
      Parse the line provided previously by [gid.gstvideo1.video_vbiparser.VideoVBIParser.addLine].
  
      Params:
        anc = a #GstVideoAncillary to start the eventual ancillary data
      Returns: [gid.gstvideo1.types.VideoVBIParserResult.Ok] if ancillary data was found and
        anc was filled. [gid.gstvideo1.types.VideoVBIParserResult.Done] if there wasn't any
        data.
  */
  gid.gstvideo1.types.VideoVBIParserResult getAncillary(out gid.gstvideo1.types.VideoAncillary anc) nothrow
  {
    GstVideoVBIParserResult _cretval;
    _cretval = gst_video_vbi_parser_get_ancillary(cast(GstVideoVBIParser*)this._cPtr, cast(GstVideoAncillary*)&anc);
    gid.gstvideo1.types.VideoVBIParserResult _retval = cast(gid.gstvideo1.types.VideoVBIParserResult)_cretval;
    return _retval;
  }
}
