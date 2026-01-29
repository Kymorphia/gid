/// Module for [Feature] struct
module harfbuzz.feature;

import gid.gid;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    The #hb_feature_t is the structure that holds information about requested
    feature application. The feature will be applied with the given value to all
    glyphs which are in clusters between @start (inclusive) and @end (exclusive).
    Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
    specifies that the feature always applies to the entire buffer.
*/
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
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_feature_get_type != &gidSymbolNotFound ? hb_gobject_feature_get_type() : cast(GType)0;
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
}
