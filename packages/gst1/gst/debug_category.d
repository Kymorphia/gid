/// Module for [DebugCategory] class
module gst.debug_category;

public import gid.basictypes;
import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    This is the struct that describes the categories. Once initialized with
    #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore.
*/
class DebugCategory
{
  GstDebugCategory _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstDebugCategory*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Returns the color of a debug category used when printing output in this
      category.
      Returns: the color of the category.
  */
  uint getColor() nothrow
  {
    uint _retval;
    _retval = gst_debug_category_get_color(cast(GstDebugCategory*)this._cPtr);
    return _retval;
  }

  /**
      Returns the description of a debug category.
      Returns: the description of the category.
  */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_debug_category_get_description(cast(GstDebugCategory*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the name of a debug category.
      Returns: the name of the category.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_debug_category_get_name(cast(GstDebugCategory*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the threshold of a #GstDebugCategory.
      Returns: the #GstDebugLevel that is used as threshold.
  */
  gst.types.DebugLevel getThreshold() nothrow
  {
    GstDebugLevel _cretval;
    _cretval = gst_debug_category_get_threshold(cast(GstDebugCategory*)this._cPtr);
    gst.types.DebugLevel _retval = cast(gst.types.DebugLevel)_cretval;
    return _retval;
  }

  /**
      Resets the threshold of the category to the default level. Debug information
      will only be output if the threshold is lower or equal to the level of the
      debugging message.
      Use this function to set the threshold back to where it was after using
      [gst.debug_category.DebugCategory.setThreshold].
  */
  void resetThreshold() nothrow
  {
    gst_debug_category_reset_threshold(cast(GstDebugCategory*)this._cPtr);
  }

  /**
      Sets the threshold of the category to the given level. Debug information will
      only be output if the threshold is lower or equal to the level of the
      debugging message.
      > Do not use this function in production code, because other functions may
      > change the threshold of categories as side effect. It is however a nice
      > function to use when debugging (even from gdb).
  
      Params:
        level = the #GstDebugLevel threshold to set.
  */
  void setThreshold(gst.types.DebugLevel level) nothrow
  {
    gst_debug_category_set_threshold(cast(GstDebugCategory*)this._cPtr, level);
  }
}
