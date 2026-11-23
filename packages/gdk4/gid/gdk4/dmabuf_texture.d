/// Module for [DmabufTexture] class
module gid.gdk4.dmabuf_texture;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.paintable;
import gid.gdk4.paintable_mixin;
import gid.gdk4.texture;
import gid.gdk4.types;
import gid.gio2.icon;
import gid.gio2.icon_mixin;
import gid.gio2.loadable_icon;
import gid.gio2.loadable_icon_mixin;
import gid.gobject2.gid_builder;

/**
    A [gid.gdk4.texture.Texture] representing a DMA buffer.
    
    To create a [gid.gdk4.dmabuf_texture.DmabufTexture], use the auxiliary
    [gid.gdk4.dmabuf_texture_builder.DmabufTextureBuilder] object.
    
    Dma-buf textures can only be created on Linux.
*/
class DmabufTexture : gid.gdk4.texture.Texture
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
    return cast(void function())gdk_dmabuf_texture_get_type != &gidSymbolNotFound ? gdk_dmabuf_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDmabufTexture";
  }

  /** Returns `this`, for use in `with` statements. */
  override DmabufTexture self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.dmabuf_texture.DmabufTexture]
      Returns: New builder object
  */
  static DmabufTextureGidBuilder builder() nothrow
  {
    return new DmabufTextureGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gdk4.dmabuf_texture.DmabufTexture]
class DmabufTextureGidBuilderImpl(T) : gid.gdk4.texture.TextureGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gdk4.dmabuf_texture.DmabufTexture]
final class DmabufTextureGidBuilder : DmabufTextureGidBuilderImpl!DmabufTextureGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DmabufTexture build() nothrow
  {
    return new DmabufTexture(cast(void*)createGObject(DmabufTexture._getGType), Yes.Take);
  }
}
