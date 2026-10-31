/// Module for [GLTexture] class
module gdk.gltexture;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.paintable;
import gdk.paintable_mixin;
import gdk.texture;
import gdk.types;
import gid.gid;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import gobject.gid_builder;

/**
    A GdkTexture representing a GL texture object.
*/
class GLTexture : gdk.texture.Texture
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_gl_texture_get_type != &gidSymbolNotFound ? gdk_gl_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLTexture self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gdk.gltexture.GLTexture]
      Returns: New builder object
  */
  static GLTextureGidBuilder builder() nothrow
  {
    return new GLTextureGidBuilder;
  }

  /**
      Releases the GL resources held by a [gdk.gltexture.GLTexture].
      
      The texture contents are still available via the
      [gdk.texture.Texture.download] function, after this
      function has been called.
  */
  void release() nothrow
  {
    gdk_gl_texture_release(cast(GdkGLTexture*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gdk.gltexture.GLTexture]
class GLTextureGidBuilderImpl(T) : gdk.texture.TextureGidBuilderImpl!T
{

}

/// Fluent builder for [gdk.gltexture.GLTexture]
final class GLTextureGidBuilder : GLTextureGidBuilderImpl!GLTextureGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GLTexture build() nothrow
  {
    return new GLTexture(cast(void*)createGObject(GLTexture._getGType), Yes.Take);
  }
}
