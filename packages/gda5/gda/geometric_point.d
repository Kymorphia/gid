/// Module for [GeometricPoint] struct
module gda.geometric_point;

public import gid.basictypes;
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
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_geometricpoint_get_type != &gidSymbolNotFound ? gda_geometricpoint_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  void* boxCopy() nothrow
  {
    import gobject.c.functions : g_boxed_copy;
    return g_boxed_copy(_gType, cast(void*)&this);
  }

  /** */
  static void* copy(void* boxed = null) nothrow
  {
    auto _retval = gda_geometricpoint_copy(boxed);
    return _retval;
  }

  /** */
  static void free(void* boxed = null) nothrow
  {
    gda_geometricpoint_free(boxed);
  }
}
