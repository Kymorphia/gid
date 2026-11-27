/// Module for [Inhibitor] class
module gid.panel1.inhibitor;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.types;

/** */
@gidGir("Inhibitor", "InhibitorClass")
class Inhibitor : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())panel_inhibitor_get_type != &gidSymbolNotFound ? panel_inhibitor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelInhibitor";
  }

  /** Returns `this`, for use in `with` statements. */
  override Inhibitor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.inhibitor.Inhibitor]
      Returns: New builder object
  */
  static InhibitorGidBuilder builder() nothrow
  {
    return new InhibitorGidBuilder;
  }

  /** */
  void uninhibit() nothrow
  {
    panel_inhibitor_uninhibit(cast(PanelInhibitor*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.panel1.inhibitor.Inhibitor]
class InhibitorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.panel1.inhibitor.Inhibitor]
final class InhibitorGidBuilder : InhibitorGidBuilderImpl!InhibitorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Inhibitor build() nothrow
  {
    return new Inhibitor(cast(void*)createGObject(Inhibitor._getGType), Yes.Take);
  }
}
