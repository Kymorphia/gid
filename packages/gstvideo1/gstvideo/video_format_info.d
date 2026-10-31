/// Module for [VideoFormatInfo] class
module gstvideo.video_format_info;

public import gid.basictypes;
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

  /**
      Create a `video_format_info.VideoFormatInfo` wrap type.
      Params:
        format = #GstVideoFormat
        name = string representation of the format
        description = use readable description of the format
        flags = #GstVideoFormatFlags
        bits = The number of bits used to pack data items. This can be less than 8
             when multiple pixels are stored in a byte. for values > 8 multiple bytes
             should be read according to the endianness flag before applying the shift
             and mask.
        nComponents = the number of components in the video format.
        shift = the number of bits to shift away to get the component data
        depth = the depth in bits for each component
        pixelStride = the pixel stride of each component. This is the amount of
             bytes to the pixel immediately to the right. When bits < 8, the stride is
             expressed in bits. For 24-bit RGB, this would be 3 bytes, for example,
             while it would be 4 bytes for RGBx or ARGB.
        nPlanes = the number of planes for this format. The number of planes can be
             less than the amount of components when multiple components are packed into
             one plane.
        plane = the plane number where a component can be found
        poffset = the offset in the plane where the first pixel of the components
             can be found.
        wSub = subsampling factor of the width for the component. Use
              GST_VIDEO_SUB_SCALE to scale a width.
        hSub = subsampling factor of the height for the component. Use
              GST_VIDEO_SUB_SCALE to scale a height.
        unpackFormat = the format of the unpacked pixels. This format must have the
              #GST_VIDEO_FORMAT_FLAG_UNPACK flag set.
        packLines = the amount of lines that will be packed
        tileMode = The tiling mode
        tileWs = The width of a tile, in bytes, represented as a shift. DEPRECATED,
          use tile_info[] array instead.
        tileHs = The height of a tile, in bytes, represented as a shift. DEPREACTED,
          use tile_info[] array instead.
        tileInfo = Information about the tiles for each of the planes.
  */
  this(gstvideo.types.VideoFormat format = gstvideo.types.VideoFormat.init, string name = string.init, string description = string.init, gstvideo.types.VideoFormatFlags flags = gstvideo.types.VideoFormatFlags.init, uint bits = uint.init, uint nComponents = uint.init, uint[4] shift = (uint[4]).init, uint[4] depth = (uint[4]).init, int[4] pixelStride = (int[4]).init, uint nPlanes = uint.init, uint[4] plane = (uint[4]).init, uint[4] poffset = (uint[4]).init, uint[4] wSub = (uint[4]).init, uint[4] hSub = (uint[4]).init, gstvideo.types.VideoFormat unpackFormat = gstvideo.types.VideoFormat.init, int packLines = int.init, gstvideo.types.VideoTileMode tileMode = gstvideo.types.VideoTileMode.init, uint tileWs = uint.init, uint tileHs = uint.init, gstvideo.types.VideoTileInfo[4] tileInfo = (gstvideo.types.VideoTileInfo[4]).init) nothrow
  {
    this.format = format;
    this.name = name;
    this.description = description;
    this.flags = flags;
    this.bits = bits;
    this.nComponents = nComponents;
    this.shift = shift;
    this.depth = depth;
    this.pixelStride = pixelStride;
    this.nPlanes = nPlanes;
    this.plane = plane;
    this.poffset = poffset;
    this.wSub = wSub;
    this.hSub = hSub;
    this.unpackFormat = unpackFormat;
    this.packLines = packLines;
    this.tileMode = tileMode;
    this.tileWs = tileWs;
    this.tileHs = tileHs;
    this.tileInfo = tileInfo;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoFormatInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `format` field.
      Returns: #GstVideoFormat
  */
  @property gstvideo.types.VideoFormat format() nothrow
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoFormatInfo*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = #GstVideoFormat
  */
  @property void format(gstvideo.types.VideoFormat propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).format = cast(GstVideoFormat)propval;
  }

  /**
      Get `name` field.
      Returns: string representation of the format
  */
  @property string name() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstVideoFormatInfo*)this._cPtr).name);
  }

  /**
      Set `name` field.
      Params:
        propval = string representation of the format
  */
  @property void name(string propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).name = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `description` field.
      Returns: use readable description of the format
  */
  @property string description() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstVideoFormatInfo*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = use readable description of the format
  */
  @property void description(string propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).description = cast(const(char)*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `flags` field.
      Returns: #GstVideoFormatFlags
  */
  @property gstvideo.types.VideoFormatFlags flags() nothrow
  {
    return cast(gstvideo.types.VideoFormatFlags)(cast(GstVideoFormatInfo*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GstVideoFormatFlags
  */
  @property void flags(gstvideo.types.VideoFormatFlags propval) nothrow
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
  @property uint bits() nothrow
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
  @property void bits(uint propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).bits = propval;
  }

  /**
      Get `nComponents` field.
      Returns: the number of components in the video format.
  */
  @property uint nComponents() nothrow
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).nComponents;
  }

  /**
      Set `nComponents` field.
      Params:
        propval = the number of components in the video format.
  */
  @property void nComponents(uint propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).nComponents = propval;
  }

  /**
      Get `shift` field.
      Returns: the number of bits to shift away to get the component data
  */
  @property uint[4] shift() nothrow
  {
    return *cast(uint[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).shift;
  }

  /**
      Set `shift` field.
      Params:
        propval = the number of bits to shift away to get the component data
  */
  @property void shift(uint[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).shift = *cast(uint[4]*)&propval;
  }

  /**
      Get `depth` field.
      Returns: the depth in bits for each component
  */
  @property uint[4] depth() nothrow
  {
    return *cast(uint[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).depth;
  }

  /**
      Set `depth` field.
      Params:
        propval = the depth in bits for each component
  */
  @property void depth(uint[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).depth = *cast(uint[4]*)&propval;
  }

  /**
      Get `pixelStride` field.
      Returns: the pixel stride of each component. This is the amount of
           bytes to the pixel immediately to the right. When bits < 8, the stride is
           expressed in bits. For 24-bit RGB, this would be 3 bytes, for example,
           while it would be 4 bytes for RGBx or ARGB.
  */
  @property int[4] pixelStride() nothrow
  {
    return *cast(int[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).pixelStride;
  }

  /**
      Set `pixelStride` field.
      Params:
        propval = the pixel stride of each component. This is the amount of
             bytes to the pixel immediately to the right. When bits < 8, the stride is
             expressed in bits. For 24-bit RGB, this would be 3 bytes, for example,
             while it would be 4 bytes for RGBx or ARGB.
  */
  @property void pixelStride(int[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).pixelStride = *cast(int[4]*)&propval;
  }

  /**
      Get `nPlanes` field.
      Returns: the number of planes for this format. The number of planes can be
           less than the amount of components when multiple components are packed into
           one plane.
  */
  @property uint nPlanes() nothrow
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
  @property void nPlanes(uint propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).nPlanes = propval;
  }

  /**
      Get `plane` field.
      Returns: the plane number where a component can be found
  */
  @property uint[4] plane() nothrow
  {
    return *cast(uint[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).plane;
  }

  /**
      Set `plane` field.
      Params:
        propval = the plane number where a component can be found
  */
  @property void plane(uint[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).plane = *cast(uint[4]*)&propval;
  }

  /**
      Get `poffset` field.
      Returns: the offset in the plane where the first pixel of the components
           can be found.
  */
  @property uint[4] poffset() nothrow
  {
    return *cast(uint[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).poffset;
  }

  /**
      Set `poffset` field.
      Params:
        propval = the offset in the plane where the first pixel of the components
             can be found.
  */
  @property void poffset(uint[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).poffset = *cast(uint[4]*)&propval;
  }

  /**
      Get `wSub` field.
      Returns: subsampling factor of the width for the component. Use
            GST_VIDEO_SUB_SCALE to scale a width.
  */
  @property uint[4] wSub() nothrow
  {
    return *cast(uint[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).wSub;
  }

  /**
      Set `wSub` field.
      Params:
        propval = subsampling factor of the width for the component. Use
              GST_VIDEO_SUB_SCALE to scale a width.
  */
  @property void wSub(uint[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).wSub = *cast(uint[4]*)&propval;
  }

  /**
      Get `hSub` field.
      Returns: subsampling factor of the height for the component. Use
            GST_VIDEO_SUB_SCALE to scale a height.
  */
  @property uint[4] hSub() nothrow
  {
    return *cast(uint[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).hSub;
  }

  /**
      Set `hSub` field.
      Params:
        propval = subsampling factor of the height for the component. Use
              GST_VIDEO_SUB_SCALE to scale a height.
  */
  @property void hSub(uint[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).hSub = *cast(uint[4]*)&propval;
  }

  /**
      Get `unpackFormat` field.
      Returns: the format of the unpacked pixels. This format must have the
            #GST_VIDEO_FORMAT_FLAG_UNPACK flag set.
  */
  @property gstvideo.types.VideoFormat unpackFormat() nothrow
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoFormatInfo*)this._cPtr).unpackFormat;
  }

  /**
      Set `unpackFormat` field.
      Params:
        propval = the format of the unpacked pixels. This format must have the
              #GST_VIDEO_FORMAT_FLAG_UNPACK flag set.
  */
  @property void unpackFormat(gstvideo.types.VideoFormat propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).unpackFormat = cast(GstVideoFormat)propval;
  }

  /**
      Get `packLines` field.
      Returns: the amount of lines that will be packed
  */
  @property int packLines() nothrow
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).packLines;
  }

  /**
      Set `packLines` field.
      Params:
        propval = the amount of lines that will be packed
  */
  @property void packLines(int propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).packLines = propval;
  }

  /**
      Get `tileMode` field.
      Returns: The tiling mode
  */
  @property gstvideo.types.VideoTileMode tileMode() nothrow
  {
    return cast(gstvideo.types.VideoTileMode)(cast(GstVideoFormatInfo*)this._cPtr).tileMode;
  }

  /**
      Set `tileMode` field.
      Params:
        propval = The tiling mode
  */
  @property void tileMode(gstvideo.types.VideoTileMode propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).tileMode = cast(GstVideoTileMode)propval;
  }

  /**
      Get `tileWs` field.
      Returns: The width of a tile, in bytes, represented as a shift. DEPRECATED,
        use tile_info[] array instead.
  */
  @property uint tileWs() nothrow
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).tileWs;
  }

  /**
      Set `tileWs` field.
      Params:
        propval = The width of a tile, in bytes, represented as a shift. DEPRECATED,
          use tile_info[] array instead.
  */
  @property void tileWs(uint propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).tileWs = propval;
  }

  /**
      Get `tileHs` field.
      Returns: The height of a tile, in bytes, represented as a shift. DEPREACTED,
        use tile_info[] array instead.
  */
  @property uint tileHs() nothrow
  {
    return (cast(GstVideoFormatInfo*)this._cPtr).tileHs;
  }

  /**
      Set `tileHs` field.
      Params:
        propval = The height of a tile, in bytes, represented as a shift. DEPREACTED,
          use tile_info[] array instead.
  */
  @property void tileHs(uint propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).tileHs = propval;
  }

  /**
      Get `tileInfo` field.
      Returns: Information about the tiles for each of the planes.
  */
  @property gstvideo.types.VideoTileInfo[4] tileInfo() nothrow
  {
    return *cast(gstvideo.types.VideoTileInfo[4]*)&(cast(GstVideoFormatInfo*)this._cPtr).tileInfo;
  }

  /**
      Set `tileInfo` field.
      Params:
        propval = Information about the tiles for each of the planes.
  */
  @property void tileInfo(gstvideo.types.VideoTileInfo[4] propval) nothrow
  {
    (cast(GstVideoFormatInfo*)this._cPtr).tileInfo = *cast(GstVideoTileInfo[4]*)&propval;
  }

  /**
      Fill components with the number of all the components packed in plane p
      for the format info. A value of -1 in components indicates that no more
      components are packed in the plane.
  
      Params:
        plane = a plane number
        components = array used to store component numbers
  */
  void component(uint plane, out int components) nothrow
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
  int extrapolateStride(int plane, int stride) nothrow
  {
    int _retval;
    _retval = gst_video_format_info_extrapolate_stride(cast(const(GstVideoFormatInfo)*)this._cPtr, plane, stride);
    return _retval;
  }
}
