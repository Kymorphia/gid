/// Module for [AllocationParams] struct
module gst.allocation_params;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    Parameters to control the allocation of memory
*/
struct AllocationParams
{
  /**
      flags to control allocation
  */
  MemoryFlags flags;

  /**
      the desired alignment of the memory
  */
  size_t align_;

  /**
      the desired prefix
  */
  size_t prefix;

  /**
      the desired padding
  */
  size_t padding;

  /** */
  void*[4] GstReserved;

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_allocation_params_get_type != &gidSymbolNotFound ? gst_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType()
  {
    return _getGType();
  }

  void* boxCopy()
  {
    import gobject.c.functions : g_boxed_copy;
    return g_boxed_copy(_gType,
        cast(void*)&this);
  }

  /**
      Create a copy of params.
      Returns: a new #GstAllocationParams.
  */
  gst.allocation_params.AllocationParams copy()
  {
    GstAllocationParams* _cretval;
    _cretval = gst_allocation_params_copy(cast(const(GstAllocationParams)*)&this);
    gst.allocation_params.AllocationParams _retval;
    if (_cretval)
      _retval = *cast(gst.allocation_params.AllocationParams*)_cretval;
    return _retval;
  }

  /**
      Initialize params to its default values
  */
  void init_()
  {
    gst_allocation_params_init(cast(GstAllocationParams*)&this);
  }
}
