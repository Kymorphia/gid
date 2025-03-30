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
  GstVideoGLTextureUploadMeta cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstVideo.VideoGLTextureUploadMeta");

    cInstance = *cast(GstVideoGLTextureUploadMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta meta()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstVideoGLTextureUploadMeta*)cPtr).meta);
  }

  @property gstvideo.types.VideoGLTextureOrientation textureOrientation()
  {
    return cast(gstvideo.types.VideoGLTextureOrientation)(cast(GstVideoGLTextureUploadMeta*)cPtr).textureOrientation;
  }

  @property void textureOrientation(gstvideo.types.VideoGLTextureOrientation propval)
  {
    (cast(GstVideoGLTextureUploadMeta*)cPtr).textureOrientation = cast(GstVideoGLTextureOrientation)propval;
  }

  @property uint nTextures()
  {
    return (cast(GstVideoGLTextureUploadMeta*)cPtr).nTextures;
  }

  @property void nTextures(uint propval)
  {
    (cast(GstVideoGLTextureUploadMeta*)cPtr).nTextures = propval;
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
    _retval = gst_video_gl_texture_upload_meta_upload(cast(GstVideoGLTextureUploadMeta*)cPtr, _textureId);
    return _retval;
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_gl_texture_upload_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
