/// Module for [MemoryTexture] class
module gdk.memory_texture;

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
import glib.bytes;
import gobject.gid_builder;

/**
    A [gdk.texture.Texture] representing image data in memory.
*/
class MemoryTexture : gdk.texture.Texture
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
    return cast(void function())gdk_memory_texture_get_type != &gidSymbolNotFound ? gdk_memory_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryTexture self()
  {
    return this;
  }

  /**
  Get builder for [gdk.memory_texture.MemoryTexture]
  Returns: New builder object
  */
  static MemoryTextureGidBuilder builder()
  {
    return new MemoryTextureGidBuilder;
  }

  /**
      Creates a new texture for a blob of image data.
      
      The [glib.bytes.Bytes] must contain stride × height pixels
      in the given format.
  
      Params:
        width = the width of the texture
        height = the height of the texture
        format = the format of the data
        bytes = the [glib.bytes.Bytes] containing the pixel data
        stride = rowstride for the data
      Returns: A newly-created [gdk.texture.Texture]
  */
  this(int width, int height, gdk.types.MemoryFormat format, glib.bytes.Bytes bytes, size_t stride)
  {
    GdkTexture* _cretval;
    _cretval = gdk_memory_texture_new(width, height, format, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, stride);
    this(_cretval, Yes.Take);
  }
}

class MemoryTextureGidBuilderImpl(T) : gdk.texture.TextureGidBuilderImpl!T
{

}

/// Fluent builder for [gdk.memory_texture.MemoryTexture]
final class MemoryTextureGidBuilder : MemoryTextureGidBuilderImpl!MemoryTextureGidBuilder
{
  MemoryTexture build()
  {
    return new MemoryTexture(cast(void*)createGObject(MemoryTexture._getGType), Yes.Take);
  }
}
