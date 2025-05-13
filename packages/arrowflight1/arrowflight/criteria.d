/// Module for [Criteria] class
module arrowflight.criteria;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.bytes;
import gobject.object;

/** */
class Criteria : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_criteria_get_type != &gidSymbolNotFound ? gaflight_criteria_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Criteria self()
  {
    return this;
  }

  /**
      Get `expression` property.
      Returns: Opaque criteria expression, dependent on server implementation.
  */
  @property glib.bytes.Bytes expression()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.bytes.Bytes)("expression");
  }

  /**
      Set `expression` property.
      Params:
        propval = Opaque criteria expression, dependent on server implementation.
  */
  @property void expression(glib.bytes.Bytes propval)
  {
    gobject.object.ObjectWrap.setProperty!(glib.bytes.Bytes)("expression", propval);
  }

  /** */
  this(glib.bytes.Bytes expression)
  {
    GAFlightCriteria* _cretval;
    _cretval = gaflight_criteria_new(expression ? cast(GBytes*)expression._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
