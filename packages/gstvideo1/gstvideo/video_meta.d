/// Module for [VideoMeta] class
module gstvideo.video_meta;

import gid.gid;
import gst.buffer;
import gst.map_info;
import gst.meta;
import gst.meta_info;
import gst.types;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;
import gstvideo.video_alignment;

/**
    Extra buffer metadata describing image properties
    
    This meta can also be used by downstream elements to specifiy their
    buffer layout requirements for upstream. Upstream should try to
    fit those requirements, if possible, in order to prevent buffer copies.
    
    This is done by passing a custom #GstStructure to
    [gst.query.Query.addAllocationMeta] when handling the ALLOCATION query.
    This structure should be named 'video-meta' and can have the following
    fields:
    $(LIST
      * padding-top (uint): extra pixels on the top
      * padding-bottom (uint): extra pixels on the bottom
      * padding-left (uint): extra pixels on the left side
      * padding-right (uint): extra pixels on the right side
    )
    The padding fields have the same semantic as #GstVideoMeta.alignment
    and so represent the paddings requested on produced video buffers.
    
    Since 1.24 it can be serialized using [gst.meta.Meta.serialize] and
    [gst.meta.Meta.deserialize].
*/
class VideoMeta
{
  GstVideoMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_meta.VideoMeta");

    _cInstance = *cast(GstVideoMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `buffer` field.
      Returns: the buffer this metadata belongs to
  */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoMeta*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = the buffer this metadata belongs to
  */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstVideoMeta*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstVideoMeta*)this._cPtr).buffer);
  }

  /**
      Get `flags` field.
      Returns: additional video flags
  */
  @property gstvideo.types.VideoFrameFlags flags()
  {
    return cast(gstvideo.types.VideoFrameFlags)(cast(GstVideoMeta*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = additional video flags
  */
  @property void flags(gstvideo.types.VideoFrameFlags propval)
  {
    (cast(GstVideoMeta*)this._cPtr).flags = cast(GstVideoFrameFlags)propval;
  }

  /**
      Get `format` field.
      Returns: the video format
  */
  @property gstvideo.types.VideoFormat format()
  {
    return cast(gstvideo.types.VideoFormat)(cast(GstVideoMeta*)this._cPtr).format;
  }

  /**
      Set `format` field.
      Params:
        propval = the video format
  */
  @property void format(gstvideo.types.VideoFormat propval)
  {
    (cast(GstVideoMeta*)this._cPtr).format = cast(GstVideoFormat)propval;
  }

  /**
      Get `id` field.
      Returns: identifier of the frame
  */
  @property int id()
  {
    return (cast(GstVideoMeta*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = identifier of the frame
  */
  @property void id(int propval)
  {
    (cast(GstVideoMeta*)this._cPtr).id = propval;
  }

  /**
      Get `width` field.
      Returns: the video width
  */
  @property uint width()
  {
    return (cast(GstVideoMeta*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the video width
  */
  @property void width(uint propval)
  {
    (cast(GstVideoMeta*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the video height
  */
  @property uint height()
  {
    return (cast(GstVideoMeta*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the video height
  */
  @property void height(uint propval)
  {
    (cast(GstVideoMeta*)this._cPtr).height = propval;
  }

  /**
      Get `nPlanes` field.
      Returns: the number of planes in the image
  */
  @property uint nPlanes()
  {
    return (cast(GstVideoMeta*)this._cPtr).nPlanes;
  }

  /**
      Set `nPlanes` field.
      Params:
        propval = the number of planes in the image
  */
  @property void nPlanes(uint propval)
  {
    (cast(GstVideoMeta*)this._cPtr).nPlanes = propval;
  }

  /** Function alias for field `unmap` */
  alias UnmapFuncType = extern(C) gboolean function(GstVideoMeta* meta, uint plane, GstMapInfo* info);

  /**
      Get `unmap` field.
      Returns: unmap the memory of a plane
  */
  @property UnmapFuncType unmap()
  {
    return (cast(GstVideoMeta*)this._cPtr).unmap;
  }

  /**
      Get `alignment` field.
      Returns: the paddings and alignment constraints of the video buffer.
        It is up to the caller of `[gstvideo.global.bufferAddVideoMetaFull]` to set it
        using [gstvideo.video_meta.VideoMeta.setAlignment], if they did not it defaults
        to no padding and no alignment. Since: 1.18
  */
  @property gstvideo.video_alignment.VideoAlignment alignment()
  {
    return cToD!(gstvideo.video_alignment.VideoAlignment)(cast(void*)&(cast(GstVideoMeta*)this._cPtr).alignment);
  }

  /**
      Set `alignment` field.
      Params:
        propval = the paddings and alignment constraints of the video buffer.
          It is up to the caller of `[gstvideo.global.bufferAddVideoMetaFull]` to set it
          using [gstvideo.video_meta.VideoMeta.setAlignment], if they did not it defaults
          to no padding and no alignment. Since: 1.18
  */
  @property void alignment(gstvideo.video_alignment.VideoAlignment propval)
  {
    (cast(GstVideoMeta*)this._cPtr).alignment = cast(GstVideoAlignment)propval;
  }

  /**
      Compute the padded height of each plane from meta (padded size
      divided by stride).
      
      It is not valid to call this function with a meta associated to a
      TILED video format.
  
      Params:
        planeHeight = array used to store the plane height
      Returns: true if meta's alignment is valid and plane_height has been
        updated, false otherwise
  */
  bool getPlaneHeight(ref uint[] planeHeight)
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_get_plane_height(cast(GstVideoMeta*)this._cPtr, planeHeight.ptr);
    return _retval;
  }

  /**
      Compute the size, in bytes, of each video plane described in meta including
      any padding and alignment constraint defined in meta->alignment.
  
      Params:
        planeSize = array used to store the plane sizes
      Returns: true if meta's alignment is valid and plane_size has been
        updated, false otherwise
  */
  bool getPlaneSize(ref size_t[] planeSize)
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_get_plane_size(cast(GstVideoMeta*)this._cPtr, planeSize.ptr);
    return _retval;
  }

  /**
      Map the video plane with index plane in meta and return a pointer to the
      first byte of the plane and the stride of the plane.
  
      Params:
        plane = a plane
        info = a #GstMapInfo
        data = the data of plane
        stride = the stride of plane
        flags = GstMapFlags
      Returns: TRUE if the map operation was successful.
  */
  bool map(uint plane, gst.map_info.MapInfo info, out void* data, out int stride, gst.types.MapFlags flags)
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_map(cast(GstVideoMeta*)this._cPtr, plane, info ? cast(GstMapInfo*)info._cPtr : null, cast(void**)&data, cast(int*)&stride, flags);
    return _retval;
  }

  /**
      Unmap a previously mapped plane with [gstvideo.video_meta.VideoMeta.map].
  
      Params:
        plane = a plane
        info = a #GstMapInfo
      Returns: TRUE if the memory was successfully unmapped.
  */
  bool unmap(uint plane, gst.map_info.MapInfo info)
  {
    bool _retval;
    _retval = cast(bool)gst_video_meta_unmap(cast(GstVideoMeta*)this._cPtr, plane, info ? cast(GstMapInfo*)info._cPtr : null);
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
