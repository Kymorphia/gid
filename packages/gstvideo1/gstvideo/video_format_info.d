/// Module for [VideoFormatInfo] class
module gstvideo.video_format_info;

import gid.gid;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Information for a video format.
*/
class VideoFormatInfo
{
  GstVideoFormatInfo _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_format_info.VideoFormatInfo");

    _cInstance = *cast(GstVideoFormatInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `format` field.
      Returns: #GstVideoFormat
  */
  @property gstvideo.types.VideoFormat format()
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoFormatInfo*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = #GstVideoFormat
  */
  @property void format(gstvideo.types.VideoFormat propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).format = cast(GstVideoFormat)propval;
  }

  /**
      Get `name` field.
      Returns: string representation of the format
  */
  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GstVideoFormatInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = string representation of the format
  */
  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstVideoFormatInfo*)this._cPtr).name);
    dToC(propval, cast(void*)&(cast(GstVideoFormatInfo*)this._cPtr).name);
  }

  /**
      Get `description` field.
      Returns: use readable description of the format
  */
  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GstVideoFormatInfo*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = use readable description of the format
  */
  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstVideoFormatInfo*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GstVideoFormatInfo*)this._cPtr).description);
  }

  /**
      Get `flags` field.
      Returns: #GstVideoFormatFlags
  */
  @property gstvideo.types.VideoFormatFlags flags()
  {
    return cast(gstvideo.types.VideoFormatFlags)(cast(GstVideoFormatInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GstVideoFormatFlags
  */
  @property void flags(gstvideo.types.VideoFormatFlags propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).flags = cast(GstVideoFormatFlags)propval;
  }

  /**
      Get `bits` field.
      Returns: The number of bits used to pack data items. This can be less than 8
           when multiple pixels are stored in a byte. for values > 8 multiple bytes
           should be read according to the endianness flag before applying the shift
           and mask.
  */
  @property uint bits()
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).bits;
  }

  /**
      Set `bits` field.
      Params:
        propval = The number of bits used to pack data items. This can be less than 8
             when multiple pixels are stored in a byte. for values > 8 multiple bytes
             should be read according to the endianness flag before applying the shift
             and mask.
  */
  @property void bits(uint propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).bits = propval;
  }

  /**
      Get `nComponents` field.
      Returns: the number of components in the video format.
  */
  @property uint nComponents()
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).nComponents;
  }

  /**
      Set `nComponents` field.
      Params:
        propval = the number of components in the video format.
  */
  @property void nComponents(uint propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).nComponents = propval;
  }

  /**
      Get `nPlanes` field.
      Returns: the number of planes for this format. The number of planes can be
           less than the amount of components when multiple components are packed into
           one plane.
  */
  @property uint nPlanes()
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).nPlanes;
  }

  /**
      Set `nPlanes` field.
      Params:
        propval = the number of planes for this format. The number of planes can be
             less than the amount of components when multiple components are packed into
             one plane.
  */
  @property void nPlanes(uint propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).nPlanes = propval;
  }

  /**
      Get `unpackFormat` field.
      Returns: the format of the unpacked pixels. This format must have the
            #GST_VIDEO_FORMAT_FLAG_UNPACK flag set.
  */
  @property gstvideo.types.VideoFormat unpackFormat()
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoFormatInfo*)this._cPtr).unpackFormat;
  }

  /**
      Set `unpackFormat` field.
      Params:
        propval = the format of the unpacked pixels. This format must have the
              #GST_VIDEO_FORMAT_FLAG_UNPACK flag set.
  */
  @property void unpackFormat(gstvideo.types.VideoFormat propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).unpackFormat = cast(GstVideoFormat)propval;
  }

  /**
      Get `packLines` field.
      Returns: the amount of lines that will be packed
  */
  @property int packLines()
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).packLines;
  }

  /**
      Set `packLines` field.
      Params:
        propval = the amount of lines that will be packed
  */
  @property void packLines(int propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).packLines = propval;
  }

  /**
      Get `tileMode` field.
      Returns: The tiling mode
  */
  @property gstvideo.types.VideoTileMode tileMode()
  {
    return cast(gstvideo.types.VideoTileMode)(cast(GstVideoFormatInfo*)this._cPtr).tileMode;
  }

  /**
      Set `tileMode` field.
      Params:
        propval = The tiling mode
  */
  @property void tileMode(gstvideo.types.VideoTileMode propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).tileMode = cast(GstVideoTileMode)propval;
  }

  /**
      Get `tileWs` field.
      Returns: The width of a tile, in bytes, represented as a shift. DEPRECATED,
        use tile_info[] array instead.
  */
  @property uint tileWs()
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).tileWs;
  }

  /**
      Set `tileWs` field.
      Params:
        propval = The width of a tile, in bytes, represented as a shift. DEPRECATED,
          use tile_info[] array instead.
  */
  @property void tileWs(uint propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).tileWs = propval;
  }

  /**
      Get `tileHs` field.
      Returns: The height of a tile, in bytes, represented as a shift. DEPREACTED,
        use tile_info[] array instead.
  */
  @property uint tileHs()
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).tileHs;
  }

  /**
      Set `tileHs` field.
      Params:
        propval = The height of a tile, in bytes, represented as a shift. DEPREACTED,
          use tile_info[] array instead.
  */
  @property void tileHs(uint propval)
  {
    (cast(GstVideoFormatInfo*)this._cPtr).tileHs = propval;
  }

  /**
      Fill components with the number of all the components packed in plane p
      for the format info. A value of -1 in components indicates that no more
      components are packed in the plane.
  
      Params:
        plane = a plane number
        components = array used to store component numbers
  */
  void component(uint plane, out int components)
  {
    gst_video_format_info_component(cast(const(GstVideoFormatInfo)*)this._cPtr, plane, cast(int*)&components);
  }

  /**
      Extrapolate plane stride from the first stride of an image. This helper is
      useful to support legacy API were only one stride is supported.
  
      Params:
        plane = a plane number
        stride = The fist plane stride
      Returns: The extrapolated stride for plane
  */
  int extrapolateStride(int plane, int stride)
  {
    int _retval;
    _retval = gst_video_format_info_extrapolate_stride(cast(const(GstVideoFormatInfo)*)this._cPtr, plane, stride);
    return _retval;
  }
}
