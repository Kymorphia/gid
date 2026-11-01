/// Module for [VideoVBIParser] class
module gstvideo.video_vbiparser;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

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

  /**
      Create a new #GstVideoVBIParser for the specified format and pixel_width.
  
      Params:
        format = a #GstVideoFormat
        pixelWidth = The width in pixel to use
      Returns: The new #GstVideoVBIParser or null if the format and/or pixel_width
        is not supported.
  */
  this(gstvideo.types.VideoFormat format, uint pixelWidth) nothrow
  {
    GstVideoVBIParser* _cretval;
    _cretval = gst_video_vbi_parser_new(format, pixelWidth);
    this(_cretval, Yes.Take);
  }

  /** */
  gstvideo.video_vbiparser.VideoVBIParser copy() nothrow
  {
    GstVideoVBIParser* _cretval;
    _cretval = gst_video_vbi_parser_copy(cast(const(GstVideoVBIParser)*)this._cPtr);
    auto _retval = _cretval ? new gstvideo.video_vbiparser.VideoVBIParser(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
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
