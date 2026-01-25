/// Module for [VideoRegionOfInterestMeta] class
module gstvideo.video_region_of_interest_meta;

import gid.gid;
import glib.types;
import gst.meta;
import gst.meta_info;
import gst.structure;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata describing an image region of interest
*/
class VideoRegionOfInterestMeta
{
  GstVideoRegionOfInterestMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_region_of_interest_meta.VideoRegionOfInterestMeta");

    _cInstance = *cast(GstVideoRegionOfInterestMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoRegionOfInterestMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `roiType` field.
      Returns: GQuark describing the semantic of the Roi (f.i. a face, a pedestrian)
  */
  @property glib.types.Quark roiType()
  {
    return (cast(GstVideoRegionOfInterestMeta*)this._cPtr).roiType;
  }

  /**
      Set `roiType` field.
      Params:
        propval = GQuark describing the semantic of the Roi (f.i. a face, a pedestrian)
  */
  @property void roiType(glib.types.Quark propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)this._cPtr).roiType = propval;
  }

  /**
      Get `id` field.
      Returns: identifier of this particular ROI
  */
  @property int id()
  {
    return (cast(GstVideoRegionOfInterestMeta*)this._cPtr).id;
  }

  /**
      Set `id` field.
      Params:
        propval = identifier of this particular ROI
  */
  @property void id(int propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)this._cPtr).id = propval;
  }

  /**
      Get `parentId` field.
      Returns: identifier of its parent ROI, used f.i. for ROI hierarchisation.
  */
  @property int parentId()
  {
    return (cast(GstVideoRegionOfInterestMeta*)this._cPtr).parentId;
  }

  /**
      Set `parentId` field.
      Params:
        propval = identifier of its parent ROI, used f.i. for ROI hierarchisation.
  */
  @property void parentId(int propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)this._cPtr).parentId = propval;
  }

  /**
      Get `x` field.
      Returns: x component of upper-left corner
  */
  @property uint x()
  {
    return (cast(GstVideoRegionOfInterestMeta*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = x component of upper-left corner
  */
  @property void x(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: y component of upper-left corner
  */
  @property uint y()
  {
    return (cast(GstVideoRegionOfInterestMeta*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = y component of upper-left corner
  */
  @property void y(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)this._cPtr).y = propval;
  }

  /**
      Get `w` field.
      Returns: bounding box width
  */
  @property uint w()
  {
    return (cast(GstVideoRegionOfInterestMeta*)this._cPtr).w;
  }

  /**
      Set `w` field.
      Params:
        propval = bounding box width
  */
  @property void w(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)this._cPtr).w = propval;
  }

  /**
      Get `h` field.
      Returns: bounding box height
  */
  @property uint h()
  {
    return (cast(GstVideoRegionOfInterestMeta*)this._cPtr).h;
  }

  /**
      Set `h` field.
      Params:
        propval = bounding box height
  */
  @property void h(uint propval)
  {
    (cast(GstVideoRegionOfInterestMeta*)this._cPtr).h = propval;
  }

  /**
      Attach element-specific parameters to meta meant to be used by downstream
      elements which may handle this ROI.
      The name of `s` is used to identify the element these parameters are meant for.
      
      This is typically used to tell encoders how they should encode this specific region.
      For example, a structure named "roi/x264enc" could be used to give the
      QP offsets this encoder should use when encoding the region described in meta.
      Multiple parameters can be defined for the same meta so different encoders
      can be supported by cross platform applications).
  
      Params:
        s = a #GstStructure
  */
  void addParam(gst.structure.Structure s)
  {
    gst_video_region_of_interest_meta_add_param(cast(GstVideoRegionOfInterestMeta*)this._cPtr, s ? cast(GstStructure*)s._cPtr(Yes.Dup) : null);
  }

  /**
      Retrieve the parameter for meta having name as structure name,
      or null if there is none.
  
      Params:
        name = a name.
      Returns: a #GstStructure
  
      Version: See also: gst_video_region_of_interest_meta_add_param()
  */
  gst.structure.Structure getParam(string name)
  {
    GstStructure* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_video_region_of_interest_meta_get_param(cast(GstVideoRegionOfInterestMeta*)this._cPtr, _name);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_region_of_interest_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
