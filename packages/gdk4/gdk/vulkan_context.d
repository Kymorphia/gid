/// Module for [VulkanContext] class
module gdk.vulkan_context;

import gdk.c.functions;
import gdk.c.types;
import gdk.draw_context;
import gdk.types;
import gid.gid;
import gio.initable;
import gio.initable_mixin;
import gobject.dclosure;
import gobject.gid_builder;

/**
    [gdk.vulkan_context.VulkanContext] is an object representing the platform-specific
    Vulkan draw context.
    
    [gdk.vulkan_context.VulkanContext]s are created for a surface using
    [gdk.surface.Surface.createVulkanContext], and the context will match
    the characteristics of the surface.
    
    Support for [gdk.vulkan_context.VulkanContext] is platform-specific and context creation
    can fail, returning null context.
*/
class VulkanContext : gdk.draw_context.DrawContext, gio.initable.Initable
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
    return cast(void function())gdk_vulkan_context_get_type != &gidSymbolNotFound ? gdk_vulkan_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override VulkanContext self()
  {
    return this;
  }

  /**
      Get builder for [gdk.vulkan_context.VulkanContext]
      Returns: New builder object
  */
  static VulkanContextGidBuilder builder()
  {
    return new VulkanContextGidBuilder;
  }

  mixin InitableT!();

  /**
      Connect to `ImagesUpdated` signal.
  
      Emitted when the images managed by this context have changed.
        
        Usually this means that the swapchain had to be recreated,
        for example in response to a change of the surface size.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gdk.vulkan_context.VulkanContext vulkanContext)`
  
          `vulkanContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectImagesUpdated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gdk.vulkan_context.VulkanContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("images-updated", closure, after);
  }
}

/// Fluent builder implementation template for [gdk.vulkan_context.VulkanContext]
class VulkanContextGidBuilderImpl(T) : gdk.draw_context.DrawContextGidBuilderImpl!T, gio.initable.InitableGidBuilderImpl!T
{

  mixin InitableGidBuilderT!();
}

/// Fluent builder for [gdk.vulkan_context.VulkanContext]
final class VulkanContextGidBuilder : VulkanContextGidBuilderImpl!VulkanContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  VulkanContext build()
  {
    return new VulkanContext(cast(void*)createGObject(VulkanContext._getGType), No.Take);
  }
}
