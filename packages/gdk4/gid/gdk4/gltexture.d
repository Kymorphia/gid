/// Module for [GLTexture] class
module gid.gdk4.gltexture;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.glcontext;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;
import gid.gdk4.texture;
import gid.gdk4.types;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.loadable_icon;
import gid.gio2.loadable_icon_mixin;
import gid.glib2.types;
import gid.gobject2.gid_builder;

/**
    A [gid.gdk4.texture.Texture] representing a GL texture object.
*/
class GLTexture : gid.gdk4.texture.Texture
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_gl_texture_get_type != &gidSymbolNotFound ? gdk_gl_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkGLTexture";
  }

  /** Returns `this`, for use in `with` statements. */
  override GLTexture self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.gltexture.GLTexture]
      Returns: New builder object
  */
  static GLTextureGidBuilder builder() nothrow
  {
    return new GLTextureGidBuilder;
  }

  /**
      Creates a new texture for an existing GL texture.
      
      Note that the GL texture must not be modified until destroy is called,
      which will happen when the GdkTexture object is finalized, or due to
      an explicit call of [gid.gdk4.gltexture.GLTexture.release].
  
      Params:
        context = a [gid.gdk4.glcontext.GLContext]
        id = the ID of a texture that was created with context
        width = the nominal width of the texture
        height = the nominal height of the texture
        destroy = a destroy notify that will be called when the GL resources
            are released
      Returns: A newly-created
          [gid.gdk4.texture.Texture]
  
      Deprecated: [gid.gdk4.gltexture_builder.GLTextureBuilder] supersedes this function
          and provides extended functionality for creating GL textures.
  */
  this(gid.gdk4.glcontext.GLContext context, uint id, int width, int height, gid.glib2.types.DestroyNotify destroy) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      extern(C) void _destroyCallback(void* data) nothrow
      {
        gidAttachThread();
        ptrThawGC(data);
        auto _dlg = cast(gid.glib2.types.DestroyNotify*)data;

        try
        {
          (*_dlg)();
        }
        catch (Exception e)
        {
          gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.DestroyNotify");
        }
      }
      auto _destroyCB = destroy ? &_destroyCallback : null;
      GdkTexture* _cretval;
      auto _destroy = destroy ? freezeDelegate(cast(void*)&destroy) : null;
      _cretval = gdk_gl_texture_new(context ? cast(GdkGLContext*)context._cPtr(No.Dup) : null, id, width, height, _destroyCB, _destroy);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Releases the GL resources held by a [gid.gdk4.gltexture.GLTexture].
      
      The texture contents are still available via the
      [gid.gdk4.texture.Texture.download] function, after this
      function has been called.
  */
  void release() nothrow
  {
    gdk_gl_texture_release(cast(GdkGLTexture*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gdk4.gltexture.GLTexture]
class GLTextureGidBuilderImpl(T) : gid.gdk4.texture.TextureGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gdk4.gltexture.GLTexture]
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
