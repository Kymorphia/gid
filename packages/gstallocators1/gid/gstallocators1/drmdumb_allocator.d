/// Module for [DRMDumbAllocator] class
module gid.gstallocators1.drmdumb_allocator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocator;
import gid.gst1.memory;
import gid.gstallocators1.c.functions;
import gid.gstallocators1.c.types;
import gid.gstallocators1.types;

/**
    Private intance object for #GstDRMDumbAllocator.
*/
@gidGir("DRMDumbAllocator", "DRMDumbAllocatorClass")
class DRMDumbAllocator : gid.gst1.allocator.Allocator
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
    return cast(void function())gst_drm_dumb_allocator_get_type != &gidSymbolNotFound ? gst_drm_dumb_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstDRMDumbAllocator";
  }

  /** Returns `this`, for use in `with` statements. */
  override DRMDumbAllocator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gstallocators1.drmdumb_allocator.DRMDumbAllocator]
      Returns: New builder object
  */
  static DRMDumbAllocatorGidBuilder builder() nothrow
  {
    return new DRMDumbAllocatorGidBuilder;
  }

  /** */
  @property string drmDevicePath() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("drm-device-path");
  }

  /** */
  @property int drmFd() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("drm-fd");
  }

  /**
      Creates a new #GstDRMDumbAllocator for the specific device path. This
      function can fail if the path does not exist, is not a DRM device or if
      the DRM device doesnot support DUMB allocation.
  
      Params:
        drmDevicePath = path to the DRM device to open
      Returns: a new DRM Dumb allocator. Use [gid.gst1.object.ObjectWrap.unref]
          to release the allocator after usage.
  */
  static gid.gstallocators1.drmdumb_allocator.DRMDumbAllocator newWithDevicePath(string drmDevicePath) nothrow
  {
    GstAllocator* _cretval;
    const(char)* _drmDevicePath = drmDevicePath.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_drm_dumb_allocator_new_with_device_path(_drmDevicePath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstallocators1.drmdumb_allocator.DRMDumbAllocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GstDRMDumbAllocator for the specific file desciptor. This
      function can fail if the file descriptor is not a DRM device or if
      the DRM device does not support DUMB allocation.
  
      Params:
        drmFd = file descriptor of the DRM device
      Returns: a new DRM Dumb allocator. Use [gid.gst1.object.ObjectWrap.unref]
          to release the allocator after usage.
  */
  static gid.gstallocators1.drmdumb_allocator.DRMDumbAllocator newWithFd(int drmFd) nothrow
  {
    GstAllocator* _cretval;
    _cretval = gst_drm_dumb_allocator_new_with_fd(drmFd);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gstallocators1.drmdumb_allocator.DRMDumbAllocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  alias alloc = gid.gst1.allocator.Allocator.alloc;

  /**
      Allocated a DRM buffer object for the specific drm_fourcc, width and
      height. Note that the DRM Dumb allocation interface is agnostic to the
      pixel format. This drm_fourcc is converted into a bpp (bit-per-pixel)
      number and the height is scaled according to the sub-sampling.
  
      Params:
        drmFourcc = the DRM format to allocate for
        width = padded width for this allocation
        height = padded height for this allocation
        outPitch = the pitch as returned by the driver
      Returns: a new DRM Dumb #GstMemory. Use [gid.gst1.memory.Memory.unref]
          to release the memory after usage.
  */
  gid.gst1.memory.Memory alloc(uint drmFourcc, uint width, uint height, out uint outPitch) nothrow
  {
    GstMemory* _cretval;
    _cretval = gst_drm_dumb_allocator_alloc(cast(GstAllocator*)this._cPtr, drmFourcc, width, height, cast(uint*)&outPitch);
    auto _retval = _cretval ? new gid.gst1.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function allow verifying if the driver support dma-buf exportation.
      Returns: true if the allocator support exporting dma-buf.
  */
  bool hasPrimeExport() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_drm_dumb_allocator_has_prime_export(cast(GstAllocator*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gstallocators1.drmdumb_allocator.DRMDumbAllocator]
class DRMDumbAllocatorGidBuilderImpl(T) : gid.gst1.allocator.AllocatorGidBuilderImpl!T
{

  /** */
  T drmDevicePath(string propval) nothrow
  {
    return setProperty("drm-device-path", propval);
  }

  /** */
  T drmFd(int propval) nothrow
  {
    return setProperty("drm-fd", propval);
  }
}

/// Fluent builder for [gid.gstallocators1.drmdumb_allocator.DRMDumbAllocator]
final class DRMDumbAllocatorGidBuilder : DRMDumbAllocatorGidBuilderImpl!DRMDumbAllocatorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DRMDumbAllocator build() nothrow
  {
    return new DRMDumbAllocator(cast(void*)createGObject(DRMDumbAllocator._getGType), Yes.Take);
  }
}
