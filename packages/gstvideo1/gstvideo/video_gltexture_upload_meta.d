/// Module for [VideoGLTextureUploadMeta] class
module gstvideo.video_gltexture_upload_meta;

public import gid.basictypes;
import gid.gid;
import gst.meta;
import gst.meta_info;
import gstvideo.c.functions;
import gstvideo.c.types;
import gstvideo.types;

/**
    Extra buffer metadata for uploading a buffer to an OpenGL texture
    ID. The caller of [gstvideo.video_gltexture_upload_meta.VideoGLTextureUploadMeta.upload] must
    have OpenGL set up and call this from a thread where it is valid
    to upload something to an OpenGL texture.
*/
class VideoGLTextureUploadMeta
{
  GstVideoGLTextureUploadMeta _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstVideoGLTextureUploadMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gst.meta.Meta meta() nothrow
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoGLTextureUploadMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `textureOrientation` field.
      Returns: Orientation of the textures
  */
  @property gstvideo.types.VideoGLTextureOrientation textureOrientation() nothrow
  {
    return cast(gstvideo.types.VideoGLTextureOrientation)(cast(GstVideoGLTextureUploadMeta*)this._cPtr).textureOrientation;
  }

  /**
      Set `textureOrientation` field.
      Params:
        propval = Orientation of the textures
  */
  @property void textureOrientation(gstvideo.types.VideoGLTextureOrientation propval) nothrow
  {
    (cast(GstVideoGLTextureUploadMeta*)this._cPtr).textureOrientation = cast(GstVideoGLTextureOrientation)propval;
  }

  /**
      Get `nTextures` field.
      Returns: Number of textures that are generated
  */
  @property uint nTextures() nothrow
  {
    return (cast(GstVideoGLTextureUploadMeta*)this._cPtr).nTextures;
  }

  /**
      Set `nTextures` field.
      Params:
        propval = Number of textures that are generated
  */
  @property void nTextures(uint propval) nothrow
  {
    (cast(GstVideoGLTextureUploadMeta*)this._cPtr).nTextures = propval;
  }

  /**
      Uploads the buffer which owns the meta to a specific texture ID.
  
      Params:
        textureId = the texture IDs to upload to
      Returns: true if uploading succeeded, false otherwise.
  */
  bool upload(uint[] textureId) nothrow
  {
    bool _retval;
    assert(!textureId || textureId.length == 4);
    auto _textureId = textureId.ptr ? cast(uint*)textureId.ptr : [uint.init].ptr;
    _retval = cast(bool)gst_video_gl_texture_upload_meta_upload(cast(GstVideoGLTextureUploadMeta*)this._cPtr, _textureId);
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_gl_texture_upload_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
