/// Module for [ConstraintGuide] class
module gid.gtk4.constraint_guide;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;

/**
    An invisible layout element in a [gid.gtk4.constraint_layout.ConstraintLayout].
    
    The [gid.gtk4.constraint_layout.ConstraintLayout] treats guides like widgets. They
    can be used as the source or target of a [gid.gtk4.constraint.Constraint].
    
    Guides have a minimum, maximum and natural size. Depending
    on the constraints that are applied, they can act like a
    guideline that widgets can be aligned to, or like *flexible
    space*.
    
    Unlike a [gid.gtk4.widget.Widget], a [gid.gtk4.constraint_guide.ConstraintGuide] will not be drawn.
*/
class ConstraintGuide : gid.gobject2.object.ObjectWrap, gid.gtk4.constraint_target.ConstraintTarget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_constraint_guide_get_type != &gidSymbolNotFound ? gtk_constraint_guide_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkConstraintGuide";
  }

  /** Returns `this`, for use in `with` statements. */
  override ConstraintGuide self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.constraint_guide.ConstraintGuide]
      Returns: New builder object
  */
  static ConstraintGuideGidBuilder builder() nothrow
  {
    return new ConstraintGuideGidBuilder;
  }

  /**
      Get `maxHeight` property.
      Returns: The maximum height of the guide.
  */
  @property int maxHeight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-height");
  }

  /**
      Set `maxHeight` property.
      Params:
        propval = The maximum height of the guide.
  */
  @property void maxHeight(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("max-height", propval);
  }

  /**
      Get `maxWidth` property.
      Returns: The maximum width of the guide.
  */
  @property int maxWidth() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-width");
  }

  /**
      Set `maxWidth` property.
      Params:
        propval = The maximum width of the guide.
  */
  @property void maxWidth(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("max-width", propval);
  }

  /**
      Get `minHeight` property.
      Returns: The minimum height of the guide.
  */
  @property int minHeight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("min-height");
  }

  /**
      Set `minHeight` property.
      Params:
        propval = The minimum height of the guide.
  */
  @property void minHeight(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("min-height", propval);
  }

  /**
      Get `minWidth` property.
      Returns: The minimum width of the guide.
  */
  @property int minWidth() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("min-width");
  }

  /**
      Set `minWidth` property.
      Params:
        propval = The minimum width of the guide.
  */
  @property void minWidth(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("min-width", propval);
  }

  /**
      Get `name` property.
      Returns: A name that identifies the [gid.gtk4.constraint_guide.ConstraintGuide], for debugging.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = A name that identifies the [gid.gtk4.constraint_guide.ConstraintGuide], for debugging.
  */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  /**
      Get `natHeight` property.
      Returns: The preferred, or natural, height of the guide.
  */
  @property int natHeight() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("nat-height");
  }

  /**
      Set `natHeight` property.
      Params:
        propval = The preferred, or natural, height of the guide.
  */
  @property void natHeight(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("nat-height", propval);
  }

  /**
      Get `natWidth` property.
      Returns: The preferred, or natural, width of the guide.
  */
  @property int natWidth() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("nat-width");
  }

  /**
      Set `natWidth` property.
      Params:
        propval = The preferred, or natural, width of the guide.
  */
  @property void natWidth(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("nat-width", propval);
  }

  /**
      Get `strength` property.
      Returns: The [gid.gtk4.types.ConstraintStrength] to be used for the constraint on
        the natural size of the guide.
  */
  @property gid.gtk4.types.ConstraintStrength strength() nothrow
  {
    return getStrength();
  }

  /**
      Set `strength` property.
      Params:
        propval = The [gid.gtk4.types.ConstraintStrength] to be used for the constraint on
          the natural size of the guide.
  */
  @property void strength(gid.gtk4.types.ConstraintStrength propval) nothrow
  {
    setStrength(propval);
  }

  mixin ConstraintTargetT!();

  /**
      Creates a new [gid.gtk4.constraint_guide.ConstraintGuide] object.
      Returns: a new [gid.gtk4.constraint_guide.ConstraintGuide] object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkConstraintGuide* _cretval;
      _cretval = gtk_constraint_guide_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the maximum size of guide.
  
      Params:
        width = return location for the maximum width
        height = return location for the maximum height
  */
  void getMaxSize(out int width, out int height) nothrow
  {
    gtk_constraint_guide_get_max_size(cast(GtkConstraintGuide*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Gets the minimum size of guide.
  
      Params:
        width = return location for the minimum width
        height = return location for the minimum height
  */
  void getMinSize(out int width, out int height) nothrow
  {
    gtk_constraint_guide_get_min_size(cast(GtkConstraintGuide*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Retrieves the name set using [gid.gtk4.constraint_guide.ConstraintGuide.setName].
      Returns: the name of the guide
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_constraint_guide_get_name(cast(GtkConstraintGuide*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the natural size of guide.
  
      Params:
        width = return location for the natural width
        height = return location for the natural height
  */
  void getNatSize(out int width, out int height) nothrow
  {
    gtk_constraint_guide_get_nat_size(cast(GtkConstraintGuide*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Retrieves the strength set using [gid.gtk4.constraint_guide.ConstraintGuide.setStrength].
      Returns: the strength of the constraint on the natural size
  */
  gid.gtk4.types.ConstraintStrength getStrength() nothrow
  {
    GtkConstraintStrength _cretval;
    _cretval = gtk_constraint_guide_get_strength(cast(GtkConstraintGuide*)this._cPtr);
    gid.gtk4.types.ConstraintStrength _retval = cast(gid.gtk4.types.ConstraintStrength)_cretval;
    return _retval;
  }

  /**
      Sets the maximum size of guide.
      
      If guide is attached to a [gid.gtk4.constraint_layout.ConstraintLayout],
      the constraints will be updated to reflect the new size.
  
      Params:
        width = the new maximum width, or -1 to not change it
        height = the new maximum height, or -1 to not change it
  */
  void setMaxSize(int width, int height) nothrow
  {
    gtk_constraint_guide_set_max_size(cast(GtkConstraintGuide*)this._cPtr, width, height);
  }

  /**
      Sets the minimum size of guide.
      
      If guide is attached to a [gid.gtk4.constraint_layout.ConstraintLayout],
      the constraints will be updated to reflect the new size.
  
      Params:
        width = the new minimum width, or -1 to not change it
        height = the new minimum height, or -1 to not change it
  */
  void setMinSize(int width, int height) nothrow
  {
    gtk_constraint_guide_set_min_size(cast(GtkConstraintGuide*)this._cPtr, width, height);
  }

  /**
      Sets a name for the given [gid.gtk4.constraint_guide.ConstraintGuide].
      
      The name is useful for debugging purposes.
  
      Params:
        name = a name for the guide
  */
  void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_constraint_guide_set_name(cast(GtkConstraintGuide*)this._cPtr, _name);
  }

  /**
      Sets the natural size of guide.
      
      If guide is attached to a [gid.gtk4.constraint_layout.ConstraintLayout],
      the constraints will be updated to reflect the new size.
  
      Params:
        width = the new natural width, or -1 to not change it
        height = the new natural height, or -1 to not change it
  */
  void setNatSize(int width, int height) nothrow
  {
    gtk_constraint_guide_set_nat_size(cast(GtkConstraintGuide*)this._cPtr, width, height);
  }

  /**
      Sets the strength of the constraint on the natural size of the
      given [gid.gtk4.constraint_guide.ConstraintGuide].
  
      Params:
        strength = the strength of the constraint
  */
  void setStrength(gid.gtk4.types.ConstraintStrength strength) nothrow
  {
    gtk_constraint_guide_set_strength(cast(GtkConstraintGuide*)this._cPtr, strength);
  }
}

/// Fluent builder implementation template for [gid.gtk4.constraint_guide.ConstraintGuide]
class ConstraintGuideGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk4.constraint_target.ConstraintTargetGidBuilderImpl!T
{

  mixin ConstraintTargetGidBuilderT!();

  /**
      Set `maxHeight` property.
      Params:
        propval = The maximum height of the guide.
      Returns: Builder instance for fluent chaining
  */
  T maxHeight(int propval) nothrow
  {
    return setProperty("max-height", propval);
  }

  /**
      Set `maxWidth` property.
      Params:
        propval = The maximum width of the guide.
      Returns: Builder instance for fluent chaining
  */
  T maxWidth(int propval) nothrow
  {
    return setProperty("max-width", propval);
  }

  /**
      Set `minHeight` property.
      Params:
        propval = The minimum height of the guide.
      Returns: Builder instance for fluent chaining
  */
  T minHeight(int propval) nothrow
  {
    return setProperty("min-height", propval);
  }

  /**
      Set `minWidth` property.
      Params:
        propval = The minimum width of the guide.
      Returns: Builder instance for fluent chaining
  */
  T minWidth(int propval) nothrow
  {
    return setProperty("min-width", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = A name that identifies the [gid.gtk4.constraint_guide.ConstraintGuide], for debugging.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `natHeight` property.
      Params:
        propval = The preferred, or natural, height of the guide.
      Returns: Builder instance for fluent chaining
  */
  T natHeight(int propval) nothrow
  {
    return setProperty("nat-height", propval);
  }

  /**
      Set `natWidth` property.
      Params:
        propval = The preferred, or natural, width of the guide.
      Returns: Builder instance for fluent chaining
  */
  T natWidth(int propval) nothrow
  {
    return setProperty("nat-width", propval);
  }

  /**
      Set `strength` property.
      Params:
        propval = The [gid.gtk4.types.ConstraintStrength] to be used for the constraint on
          the natural size of the guide.
      Returns: Builder instance for fluent chaining
  */
  T strength(gid.gtk4.types.ConstraintStrength propval) nothrow
  {
    return setProperty("strength", propval);
  }
}

/// Fluent builder for [gid.gtk4.constraint_guide.ConstraintGuide]
final class ConstraintGuideGidBuilder : ConstraintGuideGidBuilderImpl!ConstraintGuideGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ConstraintGuide build() nothrow
  {
    return new ConstraintGuide(cast(void*)createGObject(ConstraintGuide._getGType), Yes.Take);
  }
}
