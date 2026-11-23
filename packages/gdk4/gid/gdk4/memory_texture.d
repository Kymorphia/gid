/// Module for [MemoryTexture] class
module gid.gdk4.memory_texture;

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
import gid.glib2.bytes;
import gid.gobject2.gid_builder;

/**
    A [gid.gdk4.texture.Texture] representing image data in memory.
*/
class MemoryTexture : gid.gdk4.texture.Texture
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
    return cast(void function())gdk_memory_texture_get_type != &gidSymbolNotFound ? gdk_memory_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkMemoryTexture";
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryTexture self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk4.memory_texture.MemoryTexture]
      Returns: New builder object
  */
  static MemoryTextureGidBuilder builder() nothrow
  {
    return new MemoryTextureGidBuilder;
  }

  /**
      Creates a new texture for a blob of image data.
      
      The [gid.glib2.bytes.Bytes] must contain stride × height pixels
      in the given format.
  
      Params:
        width = the width of the texture
        height = the height of the texture
        format = the format of the data
        bytes = the [gid.glib2.bytes.Bytes] containing the pixel data
        stride = rowstride for the data
      Returns: A newly-created [gid.gdk4.texture.Texture]
  */
  this(int width, int height, gid.gdk4.types.MemoryFormat format, gid.glib2.bytes.Bytes bytes, size_t stride) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GdkTexture* _cretval;
      _cretval = gdk_memory_texture_new(width, height, format, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, stride);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gdk4.memory_texture.MemoryTexture]
class MemoryTextureGidBuilderImpl(T) : gid.gdk4.texture.TextureGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gdk4.memory_texture.MemoryTexture]
final class MemoryTextureGidBuilder : MemoryTextureGidBuilderImpl!MemoryTextureGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MemoryTexture build() nothrow
  {
    return new MemoryTexture(cast(void*)createGObject(MemoryTexture._getGType), Yes.Take);
  }
}
