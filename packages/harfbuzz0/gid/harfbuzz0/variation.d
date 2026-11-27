/// Module for [Variation] struct
module gid.harfbuzz0.variation;

public import gid.core.basictypes;
import gid.core.utils;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Data type for holding variation data. Registered OpenType
    variation-axis tags are listed in
    [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
@gidGir("variation_t")
struct Variation
{
  /**
      The #hb_tag_t tag of the variation-axis name
  */
  Tag tag;

  /**
      The value of the variation axis
  */
  float value;
}
