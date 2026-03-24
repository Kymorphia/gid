/// Module for [VulkanRenderer] class
module gsk.vulkan_renderer;

import gid.gid;
import gobject.gid_builder;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/**
    A GSK renderer that is using Vulkan.
    
    This renderer will fail to realize if Vulkan is not supported.
*/
class VulkanRenderer : gsk.renderer.Renderer
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
    return cast(void function())gsk_vulkan_renderer_get_type != &gidSymbolNotFound ? gsk_vulkan_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VulkanRenderer self()
  {
    return this;
  }

  /**
  Get builder for [gsk.vulkan_renderer.VulkanRenderer]
  Returns: New builder object
  */
  static VulkanRendererGidBuilder builder()
  {
    return new VulkanRendererGidBuilder;
  }

  /** */
  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_vulkan_renderer_new();
    this(_cretval, Yes.Take);
  }
}

class VulkanRendererGidBuilderImpl(T) : gsk.renderer.RendererGidBuilderImpl!T
{
}

/// Fluent builder for [gsk.vulkan_renderer.VulkanRenderer]
final class VulkanRendererGidBuilder : VulkanRendererGidBuilderImpl!VulkanRendererGidBuilder
{
  VulkanRenderer build()
  {
    return new VulkanRenderer(cast(void*)createGObject(VulkanRenderer._getGType), Yes.Take);
  }
}
