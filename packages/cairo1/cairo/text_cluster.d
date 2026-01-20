/// Module for [TextCluster] struct
module cairo.text_cluster;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;

/**
    The #cairo_text_cluster_t structure holds information about a single
    <firstterm>text cluster</firstterm>.  A text cluster is a minimal
    mapping of some glyphs corresponding to some UTF-8 text.
    
    For a cluster to be valid, both @num_bytes and @num_glyphs should
    be non-negative, and at least one should be non-zero.
    Note that clusters with zero glyphs are not as well supported as
    normal clusters.  For example, PDF rendering applications typically
    ignore those clusters when PDF text is being selected.
    
    See [cairo.context.Context.showTextGlyphs] for how clusters are used in advanced
    text operations.
*/
struct TextCluster
{
  /**
      the number of bytes of UTF-8 text covered by cluster
  */
  int numBytes;

  /**
      the number of glyphs covered by cluster
  */
  int numGlyphs;
}
