/// Module for [LogContext] class
module gst.log_context;

public import gid.basictypes;
import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    A context for controlling logging behavior, for example to handle
    logging once or periodic logging, avoiding to
    spam the terminal with the same log message multiple times.
    
    ## Simple log context using static macros
    
    ``` c
    // At global/file scope:
    GST_LOG_CONTEXT_STATIC_DEFINE(my_context, GST_LOG_CONTEXT_FLAG_THROTTLE, );
    #define MY_CONTEXT GST_LOG_CONTEXT_LAZY_INIT(my_context)
    
    // Then in code:
    GST_CTX_INFO(MY_CONTEXT, "This will only appear once per file/line");
    ```
    
    ## Periodic logging
    
    For messages that should be logged periodically (e.g., maximum once per minute):
    
    ``` c
    // At global/file scope:
    GST_LOG_CONTEXT_STATIC_DEFINE(my_periodic_context, GST_LOG_CONTEXT_FLAG_THROTTLE,
      GST_LOG_CONTEXT_BUILDER_SET_INTERVAL(60 * GST_SECOND);
    );
    #define MY_PERIODIC_CONTEXT GST_LOG_CONTEXT_LAZY_INIT(my_periodic_context)
    
    // Then in code:
    GST_CTX_INFO(MY_PERIODIC_CONTEXT, "This appears once per minute");
    ```
    
    ## Customizing Message hash with custom flags and category
    
    By default, a message's hash is determined by the file name, object pointer,
    and format string. You can customize this with builder operations:
    
    ``` c
    // Ignore the object pointer when determining message hash (with throttling)
    GST_LOG_CONTEXT_STATIC_DEFINE(obj_independent_ctx, GST_LOG_CONTEXT_FLAG_THROTTLE,
      GST_LOG_CONTEXT_BUILDER_SET_HASH_FLAGS(GST_LOG_CONTEXT_IGNORE_OBJECT);
    );
    
    // Use a custom category (without throttling)
    GST_LOG_CONTEXT_STATIC_DEFINE(custom_cat_ctx, GST_LOG_CONTEXT_FLAG_NONE,
      GST_LOG_CONTEXT_BUILDER_SET_CATEGORY(my_category);
    );
    ```
*/
class LogContext : OpaqueWrap!(GstLogContext*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Resets the logging context, clearing all tracked messages.
  */
  void reset() nothrow
  {
    gst_log_context_reset(cast(GstLogContext*)this._cPtr);
  }
}
