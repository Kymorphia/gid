/// Module for [VideoGLTextureUploadMeta] class
module gid.gstvideo1.video_gltexture_upload_meta;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.meta;
import gid.gst1.meta_info;
import gid.gstvideo1.c.functions;
import gid.gstvideo1.c.types;
import gid.gstvideo1.types;

/**
    Extra buffer metadata for uploading a buffer to an OpenGL texture
    ID. The caller of [gid.gstvideo1.video_gltexture_upload_meta.VideoGLTextureUploadMeta.upload] must
    have OpenGL set up and call this from a thread where it is valid
    to upload something to an OpenGL texture.
*/
@gidGir("VideoGLTextureUploadMeta")
class VideoGLTextureUploadMeta : StructWrap!(GstVideoGLTextureUploadMeta)
{
  /**
      Create a `video_gltexture_upload_meta.VideoGLTextureUploadMeta` wrap type.
      Params:
        textureOrientation = Orientation of the textures
        nTextures = Number of textures that are generated
        textureType = Type of each texture
  */
  this(gid.gstvideo1.types.VideoGLTextureOrientation textureOrientation = gid.gstvideo1.types.VideoGLTextureOrientation.init, uint nTextures = uint.init, gid.gstvideo1.types.VideoGLTextureType[4] textureType = (gid.gstvideo1.types.VideoGLTextureType[4]).init) nothrow
  {
    this.textureOrientation = textureOrientation;
    this.nTextures = nTextures;
    this.textureType = textureType;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `meta` field.
      Returns: parent #GstMeta
  */
  @property gid.gst1.meta.Meta meta() nothrow
  {
    return new gid.gst1.meta.Meta(cast(GstMeta*)&(cast(GstVideoGLTextureUploadMeta*)this._cPtr).meta, this);
  }

  /**
      Get `textureOrientation` field.
      Returns: Orientation of the textures
  */
  @property gid.gstvideo1.types.VideoGLTextureOrientation textureOrientation() nothrow
  {
    return cast(gid.gstvideo1.types.VideoGLTextureOrientation)(cast(GstVideoGLTextureUploadMeta*)this._cPtr).textureOrientation;
  }

  /**
      Set `textureOrientation` field.
      Params:
        propval = Orientation of the textures
  */
  @property void textureOrientation(gid.gstvideo1.types.VideoGLTextureOrientation propval) nothrow
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
      Get `textureType` field.
      Returns: Type of each texture
  */
  @property gid.gstvideo1.types.VideoGLTextureType[4] textureType() nothrow
  {
    return *cast(gid.gstvideo1.types.VideoGLTextureType[4]*)&(cast(GstVideoGLTextureUploadMeta*)this._cPtr).textureType;
  }

  /**
      Set `textureType` field.
      Params:
        propval = Type of each texture
  */
  @property void textureType(gid.gstvideo1.types.VideoGLTextureType[4] propval) nothrow
  {
    (cast(GstVideoGLTextureUploadMeta*)this._cPtr).textureType = *cast(GstVideoGLTextureType[4]*)&propval;
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
    if (textureId.length > 4) textureId = textureId[0 .. 4];
    auto _textureId = cast(uint*)textureId.ptr;
    typeof(*_textureId)[4] _textureId_fixed = void;
    if (textureId.length < 4)
    {
      (cast(ubyte[])_textureId_fixed[])[] = 0;
      _textureId_fixed[0 .. textureId.length] = _textureId[0 .. textureId.length];
      _textureId = _textureId_fixed.ptr;
    }
    _retval = cast(bool)gst_video_gl_texture_upload_meta_upload(cast(GstVideoGLTextureUploadMeta*)this._cPtr, _textureId);
    return _retval;
  }

  /** */
  static gid.gst1.meta_info.MetaInfo getInfo() nothrow
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_video_gl_texture_upload_meta_get_info();
    gid.gst1.meta_info.MetaInfo _retval;
    if (_cretval)
      _retval = *cast(gid.gst1.meta_info.MetaInfo*)_cretval;
    return _retval;
  }
}
