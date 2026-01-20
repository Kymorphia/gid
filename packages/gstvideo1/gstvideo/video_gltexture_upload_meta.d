/// Module for [VideoGLTextureUploadMeta] class
module gstvideo.video_gltexture_upload_meta;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstvideo.video_gltexture_upload_meta.VideoGLTextureUploadMeta");

    _cInstance = *cast(GstVideoGLTextureUploadMeta*)ptr;

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
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoGLTextureUploadMeta*)this._cPtr).meta, No.Take);
  }

  /**
      Get `textureOrientation` field.
      Returns: Orientation of the textures
  */
  @property gstvideo.types.VideoGLTextureOrientation textureOrientation()
  {
    return cast(gstvideo.types.VideoGLTextureOrientation)(cast(GstVideoGLTextureUploadMeta*)this._cPtr).textureOrientation;
  }

  /**
      Set `textureOrientation` field.
      Params:
        propval = Orientation of the textures
  */
  @property void textureOrientation(gstvideo.types.VideoGLTextureOrientation propval)
  {
    (cast(GstVideoGLTextureUploadMeta*)this._cPtr).textureOrientation = cast(GstVideoGLTextureOrientation)propval;
  }

  /**
      Get `nTextures` field.
      Returns: Number of textures that are generated
  */
  @property uint nTextures()
  {
    return (cast(GstVideoGLTextureUploadMeta*)this._cPtr).nTextures;
  }

  /**
      Set `nTextures` field.
      Params:
        propval = Number of textures that are generated
  */
  @property void nTextures(uint propval)
  {
    (cast(GstVideoGLTextureUploadMeta*)this._cPtr).nTextures = propval;
  }

  /**
      Uploads the buffer which owns the meta to a specific texture ID.
  
      Params:
        textureId = the texture IDs to upload to
      Returns: true if uploading succeeded, false otherwise.
  */
  bool upload(uint[] textureId)
  {
    bool _retval;
    assert(!textureId || textureId.length == 4);
    auto _textureId = cast(uint*)textureId.ptr;
    _retval = cast(bool)gst_video_gl_texture_upload_meta_upload(cast(GstVideoGLTextureUploadMeta*)this._cPtr, _textureId);
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_gl_texture_upload_meta_get_info();
    gst.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gst.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
