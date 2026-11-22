/// Module for [AllocationParams] struct
module gid.gst1.allocation_params;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

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
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_allocation_params_get_type != &gidSymbolNotFound ? gst_allocation_params_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /** */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }

  /**
      Create a copy of params.
      Returns: a new #GstAllocationParams.
  */
  gid.gst1.allocation_params.AllocationParams copy() nothrow
  {
    GstAllocationParams* _cretval;
    _cretval = gst_allocation_params_copy(cast(const(GstAllocationParams)*)&this);
    gid.gst1.allocation_params.AllocationParams _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gst1.allocation_params.AllocationParams*)_cretval;
      cValueFree!(gid.gst1.allocation_params.AllocationParams)(_cretval);
    }
    return _retval;
  }

  /**
      Initialize params to its default values
  */
  void init_() nothrow
  {
    gst_allocation_params_init(cast(GstAllocationParams*)&this);
  }
}
