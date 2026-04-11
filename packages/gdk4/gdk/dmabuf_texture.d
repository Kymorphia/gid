/// Module for [DmabufTexture] class
module gdk.dmabuf_texture;

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
    A [gdk.texture.Texture] representing a DMA buffer.
    
    To create a [gdk.dmabuf_texture.DmabufTexture], use the auxiliary
    [gdk.dmabuf_texture_builder.DmabufTextureBuilder] object.
    
    Dma-buf textures can only be created on Linux.
*/
class DmabufTexture : gdk.texture.Texture
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
    return cast(void function())gdk_dmabuf_texture_get_type != &gidSymbolNotFound ? gdk_dmabuf_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DmabufTexture self()
  {
    return this;
  }

  /**
      Get builder for [gdk.dmabuf_texture.DmabufTexture]
      Returns: New builder object
  */
  static DmabufTextureGidBuilder builder()
  {
    return new DmabufTextureGidBuilder;
  }
}

/// Fluent builder implementation template for [gdk.dmabuf_texture.DmabufTexture]
class DmabufTextureGidBuilderImpl(T) : gdk.texture.TextureGidBuilderImpl!T
{

}

/// Fluent builder for [gdk.dmabuf_texture.DmabufTexture]
final class DmabufTextureGidBuilder : DmabufTextureGidBuilderImpl!DmabufTextureGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DmabufTexture build()
  {
    return new DmabufTexture(cast(void*)createGObject(DmabufTexture._getGType), No.Take);
  }
}
