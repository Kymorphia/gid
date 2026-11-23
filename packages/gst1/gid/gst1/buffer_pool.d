/// Module for [BufferPool] class
module gid.gst1.buffer_pool;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.allocation_params;
import gid.gst1.allocator;
import gid.gst1.buffer;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.structure;
import gid.gst1.types;

/**
    A #GstBufferPool is an object that can be used to pre-allocate and recycle
    buffers of the same size and with the same properties.
    
    A #GstBufferPool is created with [gid.gst1.buffer_pool.BufferPool.new_].
    
    Once a pool is created, it needs to be configured. A call to
    [gid.gst1.buffer_pool.BufferPool.getConfig] returns the current configuration structure from
    the pool. With [gid.gst1.buffer_pool.BufferPool.configSetParams] and
    [gid.gst1.buffer_pool.BufferPool.configSetAllocator] the bufferpool parameters and
    allocator can be configured. Other properties can be configured in the pool
    depending on the pool implementation.
    
    A bufferpool can have extra options that can be enabled with
    [gid.gst1.buffer_pool.BufferPool.configAddOption]. The available options can be retrieved
    with [gid.gst1.buffer_pool.BufferPool.getOptions]. Some options allow for additional
    configuration properties to be set.
    
    After the configuration structure has been configured,
    [gid.gst1.buffer_pool.BufferPool.setConfig] updates the configuration in the pool. This can
    fail when the configuration structure is not accepted.
    
    After the pool has been configured, it can be activated with
    [gid.gst1.buffer_pool.BufferPool.setActive]. This will preallocate the configured resources
    in the pool.
    
    When the pool is active, [gid.gst1.buffer_pool.BufferPool.acquireBuffer] can be used to
    retrieve a buffer from the pool.
    
    Buffers allocated from a bufferpool will automatically be returned to the
    pool with [gid.gst1.buffer_pool.BufferPool.releaseBuffer] when their refcount drops to 0.
    
    The bufferpool can be deactivated again with [gid.gst1.buffer_pool.BufferPool.setActive].
    All further [gid.gst1.buffer_pool.BufferPool.acquireBuffer] calls will return an error. When
    all buffers are returned to the pool they will be freed.
*/
class BufferPool : gid.gst1.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_buffer_pool_get_type != &gidSymbolNotFound ? gst_buffer_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstBufferPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.buffer_pool.BufferPool]
      Returns: New builder object
  */
  static BufferPoolGidBuilder builder() nothrow
  {
    return new BufferPoolGidBuilder;
  }

  /**
      Creates a new #GstBufferPool instance.
      Returns: a new #GstBufferPool instance
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstBufferPool* _cretval;
      _cretval = gst_buffer_pool_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Enables the option in config. This will instruct the bufferpool to enable
      the specified option on the buffers that it allocates.
      
      The options supported by pool can be retrieved with [gid.gst1.buffer_pool.BufferPool.getOptions].
  
      Params:
        config = a #GstBufferPool configuration
        option = an option to add
  */
  static void configAddOption(gid.gst1.structure.Structure config, string option) nothrow
  {
    const(char)* _option = option.toCString!(No.Malloc, No.Nullable);
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
  static bool configGetAllocator(gid.gst1.structure.Structure config, out gid.gst1.allocator.Allocator allocator, out gid.gst1.allocation_params.AllocationParams params) nothrow
  {
    bool _retval;
    GstAllocator* _allocator;
    _retval = cast(bool)gst_buffer_pool_config_get_allocator(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, &_allocator, cast(GstAllocationParams*)&params);
    allocator = gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.allocator.Allocator)(_allocator, No.Take);
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
  static string configGetOption(gid.gst1.structure.Structure config, uint index) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_buffer_pool_config_get_option(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, index);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
  static bool configGetParams(gid.gst1.structure.Structure config, out gid.gst1.caps.Caps caps, out uint size, out uint minBuffers, out uint maxBuffers) nothrow
  {
    bool _retval;
    GstCaps* _caps;
    _retval = cast(bool)gst_buffer_pool_config_get_params(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, &_caps, cast(uint*)&size, cast(uint*)&minBuffers, cast(uint*)&maxBuffers);
    if (_caps)
      caps = new gid.gst1.caps.Caps(cast(void*)_caps, No.Take);
    return _retval;
  }

  /**
      Checks if config contains option.
  
      Params:
        config = a #GstBufferPool configuration
        option = an option
      Returns: true if the options array contains option.
  */
  static bool configHasOption(gid.gst1.structure.Structure config, string option) nothrow
  {
    bool _retval;
    const(char)* _option = option.toCString!(No.Malloc, No.Nullable);
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
  static uint configNOptions(gid.gst1.structure.Structure config) nothrow
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
      
      A call to [gid.gst1.buffer_pool.BufferPool.setConfig] can update the allocator and params
      with the values that it is able to do. Some pools are, for example, not able
      to operate with different allocators or cannot allocate with the values
      specified in params. Use [gid.gst1.buffer_pool.BufferPool.getConfig] to get the currently
      used values.
  
      Params:
        config = a #GstBufferPool configuration
        allocator = a #GstAllocator
        params = #GstAllocationParams
  */
  static void configSetAllocator(gid.gst1.structure.Structure config, gid.gst1.allocator.Allocator allocator = null, gid.gst1.allocation_params.AllocationParams* params = null) nothrow
  {
    gst_buffer_pool_config_set_allocator(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, allocator ? cast(GstAllocator*)allocator._cPtr(No.Dup) : null, cast(const(GstAllocationParams)*)params);
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
  static void configSetParams(gid.gst1.structure.Structure config, gid.gst1.caps.Caps caps, uint size, uint minBuffers, uint maxBuffers) nothrow
  {
    gst_buffer_pool_config_set_params(config ? cast(GstStructure*)config._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, size, minBuffers, maxBuffers);
  }

  /**
      Validates that changes made to config are still valid in the context of the
      expected parameters. This function is a helper that can be used to validate
      changes made by a pool to a config when [gid.gst1.buffer_pool.BufferPool.setConfig]
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
  static bool configValidateParams(gid.gst1.structure.Structure config, gid.gst1.caps.Caps caps, uint size, uint minBuffers, uint maxBuffers) nothrow
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
      Returns: a #GstFlowReturn such as [gid.gst1.types.FlowReturn.Flushing] when the pool is
        inactive.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAcquireBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncAcquireBuffer(out gid.gst1.buffer.Buffer buffer, gid.gst1.types.BufferPoolAcquireParams* params = null)
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.acquireBuffer)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = _klass.acquireBuffer(cast(GstBufferPool*)this._cPtr, &_buffer, cast(GstBufferPoolAcquireParams*)params);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Allocate a buffer. the default implementation allocates
      buffers from the configured memory allocator and with the configured
      parameters. All metadata that is present on the allocated buffer will
      be marked as #GST_META_FLAG_POOLED and #GST_META_FLAG_LOCKED and will
      not be removed from the buffer in #GstBufferPoolClass::reset_buffer.
      The buffer should have the #GST_BUFFER_FLAG_TAG_MEMORY cleared.
  
      Params:
        buffer = a location for a #GstBuffer
        params = parameters.
      Returns: a #GstFlowReturn to indicate whether the allocation was
        successful.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAllocBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.gst1.types.FlowReturn vfuncAllocBuffer(out gid.gst1.buffer.Buffer buffer, gid.gst1.types.BufferPoolAcquireParams* params = null)
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.allocBuffer)
      return typeof(return).init;

    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = _klass.allocBuffer(cast(GstBufferPool*)this._cPtr, &_buffer, cast(GstBufferPoolAcquireParams*)params);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Enter the flushing state.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlushStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncFlushStart()
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.flushStart)
      return;

    _klass.flushStart(cast(GstBufferPool*)this._cPtr);
  }

  /**
      Leave the flushing state.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFlushStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncFlushStop()
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.flushStop)
      return;

    _klass.flushStop(cast(GstBufferPool*)this._cPtr);
  }

  /**
      Free a buffer. The default implementation unrefs the buffer.
  
      Params:
        buffer = the #GstBuffer to free (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFreeBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncFreeBuffer(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.freeBuffer)
      return;

    _klass.freeBuffer(cast(GstBufferPool*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Gets a null terminated array of string with supported bufferpool options for
      pool. An option would typically be enabled with
      [gid.gst1.buffer_pool.BufferPool.configAddOption].
      Returns: a null terminated array
                 of strings.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetOptions` to chain up from an override.
      Overriding it from D is not supported (callback return container type 'Array' ownership 'None' is not supported).
  */
  protected string[] vfuncGetOptions()
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.getOptions)
      return typeof(return).init;

    const(char*)* _cretval;
    _cretval = _klass.getOptions(cast(GstBufferPool*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Releases buffer to pool. buffer should have previously been allocated from
      pool with [gid.gst1.buffer_pool.BufferPool.acquireBuffer].
      
      This function is usually called automatically when the last ref on buffer
      disappears.
  
      Params:
        buffer = a #GstBuffer
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReleaseBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncReleaseBuffer(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.releaseBuffer)
      return;

    _klass.releaseBuffer(cast(GstBufferPool*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
  }

  /**
      Reset the buffer to its state when it was freshly allocated.
      The default implementation will clear the flags, timestamps and
      will remove the metadata without the #GST_META_FLAG_POOLED flag (even
      the metadata with #GST_META_FLAG_LOCKED). If the
      #GST_BUFFER_FLAG_TAG_MEMORY was set, this function can also try to
      restore the memory and clear the #GST_BUFFER_FLAG_TAG_MEMORY again.
  
      Params:
        buffer = the #GstBuffer to reset (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncResetBuffer` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncResetBuffer(gid.gst1.buffer.Buffer buffer)
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.resetBuffer)
      return;

    _klass.resetBuffer(cast(GstBufferPool*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Sets the configuration of the pool. If the pool is already configured, and
      the configuration hasn't changed, this function will return true. If the
      pool is active, this method will return false and active configuration
      will remain. Buffers allocated from this pool must be returned or else this
      function will do nothing and return false.
      
      config is a #GstStructure that contains the configuration parameters for
      the pool. A default and mandatory set of parameters can be configured with
      [gid.gst1.buffer_pool.BufferPool.configSetParams], [gid.gst1.buffer_pool.BufferPool.configSetAllocator]
      and [gid.gst1.buffer_pool.BufferPool.configAddOption].
      
      If the parameters in config can not be set exactly, this function returns
      false and will try to update as much state as possible. The new state can
      then be retrieved and refined with [gid.gst1.buffer_pool.BufferPool.getConfig].
      
      This function takes ownership of config.
  
      Params:
        config = a #GstStructure
      Returns: true when the configuration could be set.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetConfig` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncSetConfig(gid.gst1.structure.Structure config)
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.setConfig)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.setConfig(cast(GstBufferPool*)this._cPtr, config ? cast(GstStructure*)config._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Start the bufferpool. The default implementation will preallocate
      min-buffers buffers and put them in the queue.
      
      Subclasses do not need to chain up to the parent's default implementation
      if they don't want min-buffers based preallocation.
      Returns: whether the pool could be started.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncStart()
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.start)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.start(cast(GstBufferPool*)this._cPtr);
    return _retval;
  }

  /**
      Stop the bufferpool. the default implementation will free the
      preallocated buffers. This function is called when all the buffers are
      returned to the pool.
      Returns: whether the pool could be stopped.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStop` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncStop()
  {
    auto _klass = cast(GstBufferPoolClass*)_vfuncClass;
    if (!_klass.stop)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stop(cast(GstBufferPool*)this._cPtr);
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
      Returns: a #GstFlowReturn such as [gid.gst1.types.FlowReturn.Flushing] when the pool is
        inactive.
  */
  gid.gst1.types.FlowReturn acquireBuffer(out gid.gst1.buffer.Buffer buffer, gid.gst1.types.BufferPoolAcquireParams* params = null) nothrow
  {
    GstFlowReturn _cretval;
    GstBuffer* _buffer;
    _cretval = gst_buffer_pool_acquire_buffer(cast(GstBufferPool*)this._cPtr, &_buffer, cast(GstBufferPoolAcquireParams*)params);
    gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Gets a copy of the current configuration of the pool. This configuration
      can be modified and used for the [gid.gst1.buffer_pool.BufferPool.setConfig] call.
      Returns: a copy of the current configuration of pool.
  */
  gid.gst1.structure.Structure getConfig() nothrow
  {
    GstStructure* _cretval;
    _cretval = gst_buffer_pool_get_config(cast(GstBufferPool*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.structure.Structure(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a null terminated array of string with supported bufferpool options for
      pool. An option would typically be enabled with
      [gid.gst1.buffer_pool.BufferPool.configAddOption].
      Returns: a null terminated array
                 of strings.
  */
  string[] getOptions() nothrow
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
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Checks if the bufferpool supports option.
  
      Params:
        option = an option
      Returns: true if the buffer pool contains option.
  */
  bool hasOption(string option) nothrow
  {
    bool _retval;
    const(char)* _option = option.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gst_buffer_pool_has_option(cast(GstBufferPool*)this._cPtr, _option);
    return _retval;
  }

  /**
      Checks if pool is active. A pool can be activated with the
      [gid.gst1.buffer_pool.BufferPool.setActive] call.
      Returns: true when the pool is active.
  */
  bool isActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_buffer_pool_is_active(cast(GstBufferPool*)this._cPtr);
    return _retval;
  }

  /**
      Releases buffer to pool. buffer should have previously been allocated from
      pool with [gid.gst1.buffer_pool.BufferPool.acquireBuffer].
      
      This function is usually called automatically when the last ref on buffer
      disappears.
  
      Params:
        buffer = a #GstBuffer
  */
  void releaseBuffer(gid.gst1.buffer.Buffer buffer) nothrow
  {
    gst_buffer_pool_release_buffer(cast(GstBufferPool*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
  }

  /**
      Controls the active state of pool. When the pool is inactive, new calls to
      [gid.gst1.buffer_pool.BufferPool.acquireBuffer] will return with [gid.gst1.types.FlowReturn.Flushing].
      
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
  bool setActive(bool active) nothrow
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
      [gid.gst1.buffer_pool.BufferPool.configSetParams], [gid.gst1.buffer_pool.BufferPool.configSetAllocator]
      and [gid.gst1.buffer_pool.BufferPool.configAddOption].
      
      If the parameters in config can not be set exactly, this function returns
      false and will try to update as much state as possible. The new state can
      then be retrieved and refined with [gid.gst1.buffer_pool.BufferPool.getConfig].
      
      This function takes ownership of config.
  
      Params:
        config = a #GstStructure
      Returns: true when the configuration could be set.
  */
  bool setConfig(gid.gst1.structure.Structure config) nothrow
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
  void setFlushing(bool flushing) nothrow
  {
    gst_buffer_pool_set_flushing(cast(GstBufferPool*)this._cPtr, flushing);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from BufferPool
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.buffer_pool.BufferPool), T.stringof ~ " is not derived from gid.gst1.buffer_pool.BufferPool");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcquireBuffer", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "acquire_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAllocBuffer", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "alloc_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlushStart", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "flush_start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFlushStop", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "flush_stop");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFreeBuffer", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "free_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetOptions", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      static assert(0, "Overriding gid.gst1.buffer_pool.BufferPool.vfuncGetOptions is not supported: callback return container type 'Array' ownership 'None' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReleaseBuffer", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "release_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResetBuffer", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "reset_buffer");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetConfig", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "set_config");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStart", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "start");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStop", true)[0]) == gid.gst1.buffer_pool.BufferPool))
      _installVfunc(klass, "stop");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstBufferPoolClass*)klass;

    switch (vfunc)
    {
      case "acquire_buffer":
      {
        static extern(C) GstFlowReturn _vfuncAcquireBufferTramp(GstBufferPool* pool, GstBuffer** buffer, GstBufferPoolAcquireParams* params) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.acquireBuffer)
              return (cast(typeof(&_vfuncAcquireBufferTramp))_klass.acquireBuffer)(pool, buffer, params);
            return typeof(return).init;
          }

          typeof(*buffer) _bufferNull;
          if (!buffer)
            buffer = &_bufferNull;

          gid.gst1.types.FlowReturn _dretval;
          gid.gst1.buffer.Buffer _buffer;

          try
          {
            _dretval = _obj.vfuncAcquireBuffer(_buffer, cast(gid.gst1.types.BufferPoolAcquireParams*)params);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncAcquireBuffer");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          *buffer = _buffer ? cast(GstBuffer*)_buffer._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.acquireBuffer = cast(typeof(_klass.acquireBuffer))&_vfuncAcquireBufferTramp;
        break;
      }
      case "alloc_buffer":
      {
        static extern(C) GstFlowReturn _vfuncAllocBufferTramp(GstBufferPool* pool, GstBuffer** buffer, GstBufferPoolAcquireParams* params) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.allocBuffer)
              return (cast(typeof(&_vfuncAllocBufferTramp))_klass.allocBuffer)(pool, buffer, params);
            return typeof(return).init;
          }

          typeof(*buffer) _bufferNull;
          if (!buffer)
            buffer = &_bufferNull;

          gid.gst1.types.FlowReturn _dretval;
          gid.gst1.buffer.Buffer _buffer;

          try
          {
            _dretval = _obj.vfuncAllocBuffer(_buffer, cast(gid.gst1.types.BufferPoolAcquireParams*)params);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncAllocBuffer");
          }
          auto _retval = cast(GstFlowReturn)_dretval;
          *buffer = _buffer ? cast(GstBuffer*)_buffer._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.allocBuffer = cast(typeof(_klass.allocBuffer))&_vfuncAllocBufferTramp;
        break;
      }
      case "flush_start":
      {
        static extern(C) void _vfuncFlushStartTramp(GstBufferPool* pool) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.flushStart)
              return (cast(typeof(&_vfuncFlushStartTramp))_klass.flushStart)(pool);
            return;
          }

          try
          {
            _obj.vfuncFlushStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncFlushStart");
          }
        }

        _klass.flushStart = cast(typeof(_klass.flushStart))&_vfuncFlushStartTramp;
        break;
      }
      case "flush_stop":
      {
        static extern(C) void _vfuncFlushStopTramp(GstBufferPool* pool) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.flushStop)
              return (cast(typeof(&_vfuncFlushStopTramp))_klass.flushStop)(pool);
            return;
          }

          try
          {
            _obj.vfuncFlushStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncFlushStop");
          }
        }

        _klass.flushStop = cast(typeof(_klass.flushStop))&_vfuncFlushStopTramp;
        break;
      }
      case "free_buffer":
      {
        static extern(C) void _vfuncFreeBufferTramp(GstBufferPool* pool, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.freeBuffer)
              return (cast(typeof(&_vfuncFreeBufferTramp))_klass.freeBuffer)(pool, buffer);
            return;
          }

          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncFreeBuffer(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncFreeBuffer");
          }
          if (_buffer)
            _buffer._cUnborrow;

        }

        _klass.freeBuffer = cast(typeof(_klass.freeBuffer))&_vfuncFreeBufferTramp;
        break;
      }
      case "release_buffer":
      {
        static extern(C) void _vfuncReleaseBufferTramp(GstBufferPool* pool, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.releaseBuffer)
              return (cast(typeof(&_vfuncReleaseBufferTramp))_klass.releaseBuffer)(pool, buffer);
            return;
          }

          try
          {
            _obj.vfuncReleaseBuffer(buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncReleaseBuffer");
          }
        }

        _klass.releaseBuffer = cast(typeof(_klass.releaseBuffer))&_vfuncReleaseBufferTramp;
        break;
      }
      case "reset_buffer":
      {
        static extern(C) void _vfuncResetBufferTramp(GstBufferPool* pool, GstBuffer* buffer) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.resetBuffer)
              return (cast(typeof(&_vfuncResetBufferTramp))_klass.resetBuffer)(pool, buffer);
            return;
          }

          auto _buffer = buffer ? new gid.gst1.buffer.Buffer(cast(void*)buffer, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncResetBuffer(_buffer);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncResetBuffer");
          }
          if (_buffer)
            _buffer._cUnborrow;

        }

        _klass.resetBuffer = cast(typeof(_klass.resetBuffer))&_vfuncResetBufferTramp;
        break;
      }
      case "set_config":
      {
        static extern(C) gboolean _vfuncSetConfigTramp(GstBufferPool* pool, GstStructure* config) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.setConfig)
              return (cast(typeof(&_vfuncSetConfigTramp))_klass.setConfig)(pool, config);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSetConfig(config ? new gid.gst1.structure.Structure(cast(void*)config, Yes.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncSetConfig");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setConfig = cast(typeof(_klass.setConfig))&_vfuncSetConfigTramp;
        break;
      }
      case "start":
      {
        static extern(C) gboolean _vfuncStartTramp(GstBufferPool* pool) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.start)
              return (cast(typeof(&_vfuncStartTramp))_klass.start)(pool);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStart();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncStart");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.start = cast(typeof(_klass.start))&_vfuncStartTramp;
        break;
      }
      case "stop":
      {
        static extern(C) gboolean _vfuncStopTramp(GstBufferPool* pool) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.buffer_pool.BufferPool)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)pool);
          if (!_obj)
          {
            auto _klass = cast(GstBufferPoolClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)pool);
            if (_klass.stop)
              return (cast(typeof(&_vfuncStopTramp))_klass.stop)(pool);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStop();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.buffer_pool.BufferPool.vfuncStop");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stop = cast(typeof(_klass.stop))&_vfuncStopTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.buffer_pool.BufferPool]
class BufferPoolGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.buffer_pool.BufferPool]
final class BufferPoolGidBuilder : BufferPoolGidBuilderImpl!BufferPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BufferPool build() nothrow
  {
    return new BufferPool(cast(void*)createGObject(BufferPool._getGType), Yes.Take);
  }
}
