/// Module for [Variation] struct
module harfbuzz.variation;

import gid.gid;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Data type for holding variation data. Registered OpenType
    variation-axis tags are listed in
    [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
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
