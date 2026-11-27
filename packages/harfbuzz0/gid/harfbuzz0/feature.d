/// Module for [Feature] struct
module gid.harfbuzz0.feature;

public import gid.core.basictypes;
import gid.core.utils;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    The #hb_feature_t is the structure that holds information about requested
    feature application. The feature will be applied with the given value to all
    glyphs which are in clusters between @start (inclusive) and @end (exclusive).
    Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
    specifies that the feature always applies to the entire buffer.
*/
@gidGir("feature_t")
struct Feature
{
  /**
      The #hb_tag_t tag of the feature
  */
  Tag tag;

  /**
      The value of the feature. 0 disables the feature, non-zero (usually
      1) enables the feature.  For features implemented as lookup type 3 (like
      'salt') the @value is a one based index into the alternates.
  */
  uint value;

  /**
      the cluster to start applying this feature setting (inclusive).
  */
  uint start;

  /**
      the cluster to end applying this feature setting (exclusive).
  */
  uint end;

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_feature_get_type != &gidSymbolNotFound ? hb_gobject_feature_get_type() : cast(GType)0;
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
}
