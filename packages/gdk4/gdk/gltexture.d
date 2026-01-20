/// Module for [GLTexture] class
module gdk.gltexture;

import gdk.c.functions;
import gdk.c.types;
import gdk.glcontext;
import gdk.paintable;
import gdk.paintable_mixin;
import gdk.texture;
import gdk.types;
import gid.gid;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;
import glib.types;

/**
    A GdkTexture representing a GL texture object.
*/
class GLTexture : gdk.texture.Texture
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_gl_texture_get_type != &gidSymbolNotFound ? gdk_gl_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLTexture self()
  {
    return this;
  }

  /**
      Creates a new texture for an existing GL texture.
      
      Note that the GL texture must not be modified until destroy is called,
      which will happen when the GdkTexture object is finalized, or due to
      an explicit call of [gdk.gltexture.GLTexture.release].
  
      Params:
        context = a [gdk.glcontext.GLContext]
        id = the ID of a texture that was created with context
        width = the nominal width of the texture
        height = the nominal height of the texture
        destroy = a destroy notify that will be called when the GL resources
            are released
        data = data that gets passed to destroy
      Returns: A newly-created
          [gdk.texture.Texture]
  
      Deprecated: [gdk.gltexture_builder.GLTextureBuilder] supersedes this function
          and provides extended functionality for creating GL textures.
  */
  this(gdk.glcontext.GLContext context, uint id, int width, int height, glib.types.DestroyNotify destroy, void* data = null)
  {
    extern(C) void _destroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _destroyCB = destroy ? &_destroyCallback : null;
    GdkTexture* _cretval;
    _cretval = gdk_gl_texture_new(context ? cast(GdkGLContext*)context._cPtr(No.Dup) : null, id, width, height, _destroyCB, data);
    this(_cretval, Yes.Take);
  }

  /**
      Releases the GL resources held by a [gdk.gltexture.GLTexture].
      
      The texture contents are still available via the
      [gdk.texture.Texture.download] function, after this
      function has been called.
  */
  void release()
  {
    gdk_gl_texture_release(cast(GdkGLTexture*)this._cPtr);
  }
}
