/// Module for [SplitPatternOptions] class
module arrow.split_pattern_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class SplitPatternOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_split_pattern_options_get_type != &gidSymbolNotFound ? garrow_split_pattern_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SplitPatternOptions self()
  {
    return this;
  }

  /** */
  @property long maxSplits()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("max-splits");
  }

  /** */
  @property void maxSplits(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("max-splits", propval);
  }

  /**
      Get `pattern` property.
      Returns: The exact substring to split on.
  */
  @property string pattern()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("pattern");
  }

  /**
      Set `pattern` property.
      Params:
        propval = The exact substring to split on.
  */
  @property void pattern(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("pattern", propval);
  }

  /**
      Get `reverse` property.
      Returns: Start splitting from the end of the string (only relevant when
        max_splits != -1)
  */
  @property bool reverse()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("reverse");
  }

  /**
      Set `reverse` property.
      Params:
        propval = Start splitting from the end of the string (only relevant when
          max_splits != -1)
  */
  @property void reverse(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("reverse", propval);
  }

  /** */
  this()
  {
    GArrowSplitPatternOptions* _cretval;
    _cretval = garrow_split_pattern_options_new();
    this(_cretval, Yes.Take);
  }
}
