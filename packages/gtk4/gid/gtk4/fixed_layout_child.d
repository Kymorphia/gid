/// Module for [FixedLayoutChild] class
module gid.gtk4.fixed_layout_child;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gsk4.transform;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_child;
import gid.gtk4.types;

/**
    [gid.gtk4.layout_child.LayoutChild] subclass for children in a [gid.gtk4.fixed_layout.FixedLayout].
*/
@gidGir("FixedLayoutChild", "FixedLayoutChildClass")
class FixedLayoutChild : gid.gtk4.layout_child.LayoutChild
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
    return cast(void function())gtk_fixed_layout_child_get_type != &gidSymbolNotFound ? gtk_fixed_layout_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFixedLayoutChild";
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedLayoutChild self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.fixed_layout_child.FixedLayoutChild]
      Returns: New builder object
  */
  static FixedLayoutChildGidBuilder builder() nothrow
  {
    return new FixedLayoutChildGidBuilder;
  }

  /**
      Get `transform` property.
      Returns: The transform of the child.
  */
  @property gid.gsk4.transform.Transform transform() nothrow
  {
    return getTransform();
  }

  /**
      Set `transform` property.
      Params:
        propval = The transform of the child.
  */
  @property void transform(gid.gsk4.transform.Transform propval) nothrow
  {
    setTransform(propval);
  }

  /**
      Retrieves the transformation of the child.
      Returns: a [gid.gsk4.transform.Transform]
  */
  gid.gsk4.transform.Transform getTransform() nothrow
  {
    GskTransform* _cretval;
    _cretval = gtk_fixed_layout_child_get_transform(cast(GtkFixedLayoutChild*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.transform.Transform(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the transformation of the child of a [gid.gtk4.fixed_layout.FixedLayout].
  
      Params:
        transform = a [gid.gsk4.transform.Transform]
  */
  void setTransform(gid.gsk4.transform.Transform transform) nothrow
  {
    gtk_fixed_layout_child_set_transform(cast(GtkFixedLayoutChild*)this._cPtr, transform ? cast(GskTransform*)transform._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.fixed_layout_child.FixedLayoutChild]
class FixedLayoutChildGidBuilderImpl(T) : gid.gtk4.layout_child.LayoutChildGidBuilderImpl!T
{

  /**
      Set `transform` property.
      Params:
        propval = The transform of the child.
      Returns: Builder instance for fluent chaining
  */
  T transform(gid.gsk4.transform.Transform propval) nothrow
  {
    return setProperty("transform", propval);
  }
}

/// Fluent builder for [gid.gtk4.fixed_layout_child.FixedLayoutChild]
final class FixedLayoutChildGidBuilder : FixedLayoutChildGidBuilderImpl!FixedLayoutChildGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedLayoutChild build() nothrow
  {
    return new FixedLayoutChild(cast(void*)createGObject(FixedLayoutChild._getGType), Yes.Take);
  }
}
