/// Module for [BufferPool] class
module gst.buffer_pool;

import gid.gid;
import gst.allocation_params;
import gst.allocator;
import gst.buffer;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.object;
import gst.structure;
import gst.types;

/**
    A #GstBufferPool is an object that can be used to pre-allocate and recycle
    buffers of the same size and with the same properties.
    
    A #GstBufferPool is created with [gst.buffer_pool.BufferPool.new_].
    
    Once a pool is created, it needs to be configured. A call to
    [gst.buffer_pool.BufferPool.getConfig] returns the current configuration structure from
    the pool. With [gst.buffer_pool.BufferPool.configSetParams] and
    [gst.buffer_pool.BufferPool.configSetAllocator] the bufferpool parameters and
    allocator can be configured. Other properties can be configured in the pool
    depending on the pool implementation.
    
    A bufferpool can have extra options that can be enabled with
    [gst.buffer_pool.BufferPool.configAddOption]. The available options can be retrieved
    with [gst.buffer_pool.BufferPool.getOptions]. Some options allow for additional
    configuration properties to be set.
    
    After the configuration structure has been configured,
    [gst.buffer_pool.BufferPool.setConfig] updates the configuration in the pool. This can
    fail when the configuration structure is not accepted.
    
    After the pool has been configured, it can be activated with
    [gst.buffer_pool.BufferPool.setActive]. This will preallocate the configured resources
    in the pool.
    
    When the pool is active, [gst.buffer_pool.BufferPool.acquireBuffer] can be used to
    retrieve a buffer from the pool.
    
    Buffers allocated from a bufferpool will automatically be returned to the
    pool with [gst.buffer_pool.BufferPool.releaseBuffer] when their refcount drops to 0.
    
    The bufferpool can be deactivated again with [gst.buffer_pool.BufferPool.setActive].
    All further [gst.buffer_pool.BufferPool.acquireBuffer] calls will return an error. When
    all buffers are returned to the pool they will be freed.
*/
class BufferPool : gst.object.ObjectWrap
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
    return cast(void function())gst_buffer_pool_get_type != &gidSymbolNotFound ? gst_buffer_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferPool self()
  {
    return this;
  }

  /**
      Creates a new #GstBufferPool instance.
      Returns: a new #GstBufferPool instance
  */
  this()
  {
    GstBufferPool* _cretval;
    _cretval = gst_buffer_pool_new();
    this(_cretval, Yes.Take);
  }

  /**
      Enables the option in config. This will instruct the bufferpool to enable
      the specified option on the buffers that it allocates.
      
      The options supported by pool can be retrieved with [gst.buffer_pool.BufferPool.getOptions].
  
      Params:
        config = a #GstBufferPool configuration
        option = an option to add
  */
  static void configAddOption(gst.structure.Structure config, string option)
  {
    const(char)* _option = option.toCString(No.Alloc);
    gst_buffer_pool_config_add_option(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, _option);
  }

  /**
      Gets the allocator and params from config.
  
      Params:
        config = a #GstBufferPool configuration
        allocator = a #GstAllocator, or null
        params = #GstAllocationParams, or null
      Returns: true, if the values are set.
  */
  static bool configGetAllocator(gst.structure.Structure config, out gst.allocator.Allocator allocator, out gst.allocation_params.AllocationParams params)
  {
    bool _retval;
    GstAllocator* _allocator;
    _retval = cast(bool)gst_buffer_pool_config_get_allocator(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, &_allocator, cast(GstAllocationParams*)&params);
    allocator = new gst.allocator.Allocator(cast(void*)_allocator, No.Take);
    return _retval;
  }

  /**
      Parses an available config and gets the option at index of the options API
      array.
  
      Params:
        config = a #GstBufferPool configuration
        index = position in the option array to read
      Returns: the option at index.
  */
  static string configGetOption(gst.structure.Structure config, uint index)
  {
    const(char)* _cretval;
    _cretval = gst_buffer_pool_config_get_option(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, index);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the configuration values from config.
  
      Params:
        config = a #GstBufferPool configuration
        caps = the caps of buffers
        size = the size of each buffer, not including prefix and padding
        minBuffers = the minimum amount of buffers to allocate.
        maxBuffers = the maximum amount of buffers to allocate or 0 for unlimited.
      Returns: true if all parameters could be fetched.
  */
  static bool configGetParams(gst.structure.Structure config, out gst.caps.Caps caps, out uint size, out uint minBuffers, out uint maxBuffers)
  {
    bool _retval;
    GstCaps* _caps;
    _retval = cast(bool)gst_buffer_pool_config_get_params(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, &_caps, cast(uint*)&size, cast(uint*)&minBuffers, cast(uint*)&maxBuffers);
    caps = new gst.caps.Caps(cast(void*)_caps, No.Take);
    return _retval;
  }

  /**
      Checks if config contains option.
  
      Params:
        config = a #GstBufferPool configuration
        option = an option
      Returns: true if the options array contains option.
  */
  static bool configHasOption(gst.structure.Structure config, string option)
  {
    bool _retval;
    const(char)* _option = option.toCString(No.Alloc);
    _retval = cast(bool)gst_buffer_pool_config_has_option(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, _option);
    return _retval;
  }

  /**
      Retrieves the number of values currently stored in the options array of the
      config structure.
  
      Params:
        config = a #GstBufferPool configuration
      Returns: the options array size as a #guint.
  */
  static uint configNOptions(gst.structure.Structure config)
  {
    uint _retval;
    _retval = gst_buffer_pool_config_n_options(config ? cast(GstStructure*)config._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the allocator and params on config.
      
      One of allocator and params can be null, but not both. When allocator
      is null, the default allocator of the pool will use the values in param
      to perform its allocation. When param is null, the pool will use the
      provided allocator with its default #GstAllocationParams.
      
      A call to [gst.buffer_pool.BufferPool.setConfig] can update the allocator and params
      with the values that it is able to do. Some pools are, for example, not able
      to operate with different allocators or cannot allocate with the values
      specified in params. Use [gst.buffer_pool.BufferPool.getConfig] to get the currently
      used values.
  
      Params:
        config = a #GstBufferPool configuration
        allocator = a #GstAllocator
        params = #GstAllocationParams
  */
  static void configSetAllocator(gst.structure.Structure config, gst.allocator.Allocator allocator, gst.allocation_params.AllocationParams params)
  {
    gst_buffer_pool_config_set_allocator(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)&params);
  }

  /**
      Configures config with the given parameters.
  
      Params:
        config = a #GstBufferPool configuration
        caps = caps for the buffers
        size = the size of each buffer, not including prefix and padding
        minBuffers = the minimum amount of buffers to allocate.
        maxBuffers = the maximum amount of buffers to allocate or 0 for unlimited.
  */
  static void configSetParams(gst.structure.Structure config, gst.caps.Caps caps, uint size, uint minBuffers, uint maxBuffers)
  {
    gst_buffer_pool_config_set_params(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, size, minBuffers, maxBuffers);
  }

  /**
      Validates that changes made to config are still valid in the context of the
      expected parameters. This function is a helper that can be used to validate
      changes made by a pool to a config when [gst.buffer_pool.BufferPool.setConfig]
      returns false. This expects that caps haven't changed and that
      min_buffers aren't lower then what we initially expected.
      This does not check if options or allocator parameters are still valid,
      won't check if size have changed, since changing the size is valid to adapt
      padding.
  
      Params:
        config = a #GstBufferPool configuration
        caps = the excepted caps of buffers
        size = the expected size of each buffer, not including prefix and padding
        minBuffers = the expected minimum amount of buffers to allocate.
        maxBuffers = the expect maximum amount of buffers to allocate or 0 for unlimited.
      Returns: true, if the parameters are valid in this context.
  */
  static bool configValidateParams(gst.structure.Structure config, gst.caps.Caps caps, uint size, uint minBuffers, uint maxBuffers)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_pool_config_validate_params(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, size, minBuffers, maxBuffers);
    return _retval;
  }

  /**
      Acquires a buffer from pool. buffer should point to a memory location that
      can hold a pointer to the new buffer. When the pool is empty, this function
      will by default block until a buffer is released into the pool again or when
      the pool is set to flushing or deactivated.
      
      params can contain optional parameters to influence the allocation.
  
      Params:
        buffer = a location for a #GstBuffer
        params = parameters.
      Returns: a #GstFlowReturn such as [gst.types.FlowReturn.Flushing] when the pool is
        inactive.
  */
  gst.types.FlowReturn acquireBuffer(out gst.buffer.Buffer buffer, gst.types.BufferPoolAcquireParams params)
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_buffer_pool_acquire_buffer(cast(GstBufferPool*)this._cPtr, &_buffer, &params);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    buffer = new gst.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Gets a copy of the current configuration of the pool. This configuration
      can be modified and used for the [gst.buffer_pool.BufferPool.setConfig] call.
      Returns: a copy of the current configuration of pool.
  */
  gst.structure.Structure getConfig()
  {
    GstStructure* _cretval;
    _cretval = gst_buffer_pool_get_config(cast(GstBufferPool*)this._cPtr);
    auto _retval = _cretval ? new gst.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a null terminated array of string with supported bufferpool options for
      pool. An option would typically be enabled with
      [gst.buffer_pool.BufferPool.configAddOption].
      Returns: a null terminated array
                 of strings.
  */
  string[] getOptions()
  {
    const(char*)* _cretval;
    _cretval = gst_buffer_pool_get_options(cast(GstBufferPool*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Checks if the bufferpool supports option.
  
      Params:
        option = an option
      Returns: true if the buffer pool contains option.
  */
  bool hasOption(string option)
  {
    bool _retval;
    const(char)* _option = option.toCString(No.Alloc);
    _retval = cast(bool)gst_buffer_pool_has_option(cast(GstBufferPool*)this._cPtr, _option);
    return _retval;
  }

  /**
      Checks if pool is active. A pool can be activated with the
      [gst.buffer_pool.BufferPool.setActive] call.
      Returns: true when the pool is active.
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_pool_is_active(cast(GstBufferPool*)this._cPtr);
    return _retval;
  }

  /**
      Releases buffer to pool. buffer should have previously been allocated from
      pool with [gst.buffer_pool.BufferPool.acquireBuffer].
      
      This function is usually called automatically when the last ref on buffer
      disappears.
  
      Params:
        buffer = a #GstBuffer
  */
  void releaseBuffer(gst.buffer.Buffer buffer)
  {
    gst_buffer_pool_release_buffer(cast(GstBufferPool*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
  }

  /**
      Controls the active state of pool. When the pool is inactive, new calls to
      [gst.buffer_pool.BufferPool.acquireBuffer] will return with [gst.types.FlowReturn.Flushing].
      
      Activating the bufferpool will preallocate all resources in the pool based on
      the configuration of the pool.
      
      Deactivating will free the resources again when there are no outstanding
      buffers. When there are outstanding buffers, they will be freed as soon as
      they are all returned to the pool.
  
      Params:
        active = the new active state
      Returns: false when the pool was not configured or when preallocation of the
        buffers failed.
  */
  bool setActive(bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_pool_set_active(cast(GstBufferPool*)this._cPtr, active);
    return _retval;
  }

  /**
      Sets the configuration of the pool. If the pool is already configured, and
      the configuration hasn't changed, this function will return true. If the
      pool is active, this method will return false and active configuration
      will remain. Buffers allocated from this pool must be returned or else this
      function will do nothing and return false.
      
      config is a #GstStructure that contains the configuration parameters for
      the pool. A default and mandatory set of parameters can be configured with
      [gst.buffer_pool.BufferPool.configSetParams], [gst.buffer_pool.BufferPool.configSetAllocator]
      and [gst.buffer_pool.BufferPool.configAddOption].
      
      If the parameters in config can not be set exactly, this function returns
      false and will try to update as much state as possible. The new state can
      then be retrieved and refined with [gst.buffer_pool.BufferPool.getConfig].
      
      This function takes ownership of config.
  
      Params:
        config = a #GstStructure
      Returns: true when the configuration could be set.
  */
  bool setConfig(gst.structure.Structure config)
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_pool_set_config(cast(GstBufferPool*)this._cPtr, config ? cast(GstStructure*)config._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Enables or disables the flushing state of a pool without freeing or
      allocating buffers.
  
      Params:
        flushing = whether to start or stop flushing
  */
  void setFlushing(bool flushing)
  {
    gst_buffer_pool_set_flushing(cast(GstBufferPool*)this._cPtr, flushing);
  }
}
