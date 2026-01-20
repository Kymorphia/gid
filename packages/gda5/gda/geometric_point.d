/// Module for [GeometricPoint] struct
module gda.geometric_point;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
struct GeometricPoint
{
  /** */
  double x;

  /** */
  double y;

  /** */
  static void* copy(void* boxed = null)
  {
    auto _retval = gda_geometricpoint_copy(boxed);
    return _retval;
  }

  /** */
  static void free(void* boxed = null)
  {
    gda_geometricpoint_free(boxed);
  }
}
