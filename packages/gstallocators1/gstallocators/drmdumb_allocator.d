/// Module for [DRMDumbAllocator] class
module gstallocators.drmdumb_allocator;

import gid.gid;
import gobject.object;
import gst.allocator;
import gst.memory;
import gstallocators.c.functions;
import gstallocators.c.types;
import gstallocators.types;

/**
    Private intance object for #GstDRMDumbAllocator.
*/
class DRMDumbAllocator : gst.allocator.Allocator
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
    return cast(void function())gst_drm_dumb_allocator_get_type != &gidSymbolNotFound ? gst_drm_dumb_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DRMDumbAllocator self()
  {
    return this;
  }

  /**
      Creates a new #GstDRMDumbAllocator for the specific device path. This
      function can fail if the path does not exist, is not a DRM device or if
      the DRM device doesnot support DUMB allocation.
  
      Params:
        drmDevicePath = path to the DRM device to open
      Returns: a new DRM Dumb allocator. Use [gst.object.ObjectWrap.unref]
          to release the allocator after usage.
  */
  static gstallocators.drmdumb_allocator.DRMDumbAllocator newWithDevicePath(string drmDevicePath)
  {
    GstAllocator* _cretval;
    const(char)* _drmDevicePath = drmDevicePath.toCString(No.Alloc);
    _cretval = gst_drm_dumb_allocator_new_with_device_path(_drmDevicePath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstallocators.drmdumb_allocator.DRMDumbAllocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GstDRMDumbAllocator for the specific file desciptor. This
      function can fail if the file descriptor is not a DRM device or if
      the DRM device does not support DUMB allocation.
  
      Params:
        drmFd = file descriptor of the DRM device
      Returns: a new DRM Dumb allocator. Use [gst.object.ObjectWrap.unref]
          to release the allocator after usage.
  */
  static gstallocators.drmdumb_allocator.DRMDumbAllocator newWithFd(int drmFd)
  {
    GstAllocator* _cretval;
    _cretval = gst_drm_dumb_allocator_new_with_fd(drmFd);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gstallocators.drmdumb_allocator.DRMDumbAllocator)(cast(GstAllocator*)_cretval, Yes.Take);
    return _retval;
  }

  alias alloc = gst.allocator.Allocator.alloc;

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
      Returns: a new DRM Dumb #GstMemory. Use gst_memory_unref()
          to release the memory after usage.
  */
  gst.memory.Memory alloc(uint drmFourcc, uint width, uint height, out uint outPitch)
  {
    GstMemory* _cretval;
    _cretval = gst_drm_dumb_allocator_alloc(cast(GstAllocator*)this._cPtr, drmFourcc, width, height, cast(uint*)&outPitch);
    auto _retval = _cretval ? new gst.memory.Memory(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function allow verifying if the driver support dma-buf exportation.
      Returns: true if the allocator support exporting dma-buf.
  */
  bool hasPrimeExport()
  {
    bool _retval;
    _retval = cast(bool)gst_drm_dumb_allocator_has_prime_export(cast(GstAllocator*)this._cPtr);
    return _retval;
  }
}
