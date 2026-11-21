/// Module for [BoxLayout] class
module gid.gtk4.box_layout;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.types;

/**
    Arranges children in a single row or column.
    
    Whether it is a row or column depends on the value of its
    [gid.gtk4.orientable.Orientable.orientation] property. Within the other dimension
    all children all allocated the same size. The [gid.gtk4.box_layout.BoxLayout] will respect
    the [gid.gtk4.widget.Widget.halign] and [gid.gtk4.widget.Widget.valign]
    properties of each child widget.
    
    If you want all children to be assigned the same size, you can use
    the [gid.gtk4.box_layout.BoxLayout.homogeneous] property.
    
    If you want to specify the amount of space placed between each child,
    you can use the [gid.gtk4.box_layout.BoxLayout.spacing] property.
*/
class BoxLayout : gid.gtk4.layout_manager.LayoutManager, gid.gtk4.orientable.Orientable
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
    return cast(void function())gtk_box_layout_get_type != &gidSymbolNotFound ? gtk_box_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBoxLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override BoxLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.box_layout.BoxLayout]
      Returns: New builder object
  */
  static BoxLayoutGidBuilder builder() nothrow
  {
    return new BoxLayoutGidBuilder;
  }

  /**
      Get `baselineChild` property.
      Returns: The child that determines the baseline of the box
        in vertical layout.
        
        If the child does baseline positioning, then its baseline
        is lined up with the baseline of the box. If it doesn't, then
        the bottom edge of the child is used.
  */
  @property int baselineChild() nothrow
  {
    return getBaselineChild();
  }

  /**
      Set `baselineChild` property.
      Params:
        propval = The child that determines the baseline of the box
          in vertical layout.
          
          If the child does baseline positioning, then its baseline
          is lined up with the baseline of the box. If it doesn't, then
          the bottom edge of the child is used.
  */
  @property void baselineChild(int propval) nothrow
  {
    setBaselineChild(propval);
  }

  /**
      Get `baselinePosition` property.
      Returns: The position of the allocated baseline within the extra space
        allocated to each child.
        
        This property is only relevant for horizontal layouts containing
        at least one child with a baseline alignment.
  */
  @property gid.gtk4.types.BaselinePosition baselinePosition() nothrow
  {
    return getBaselinePosition();
  }

  /**
      Set `baselinePosition` property.
      Params:
        propval = The position of the allocated baseline within the extra space
          allocated to each child.
          
          This property is only relevant for horizontal layouts containing
          at least one child with a baseline alignment.
  */
  @property void baselinePosition(gid.gtk4.types.BaselinePosition propval) nothrow
  {
    setBaselinePosition(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Whether the box layout should distribute the available space
        equally among the children.
  */
  @property bool homogeneous() nothrow
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether the box layout should distribute the available space
          equally among the children.
  */
  @property void homogeneous(bool propval) nothrow
  {
    setHomogeneous(propval);
  }

  /**
      Get `spacing` property.
      Returns: The space to put between the children.
  */
  @property int spacing() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("spacing");
  }

  /**
      Set `spacing` property.
      Params:
        propval = The space to put between the children.
  */
  @property void spacing(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("spacing", propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gid.gtk4.box_layout.BoxLayout].
  
      Params:
        orientation = the orientation for the new layout
      Returns: a new box layout
  */
  this(gid.gtk4.types.Orientation orientation) nothrow
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_box_layout_new(orientation);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the value set by [gid.gtk4.box_layout.BoxLayout.setBaselineChild].
      Returns: the index of the child that determines the baseline
            in vertical layout, or -1
  */
  int getBaselineChild() nothrow
  {
    int _retval;
    _retval = gtk_box_layout_get_baseline_child(cast(GtkBoxLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.box_layout.BoxLayout.setBaselinePosition].
      Returns: the baseline position
  */
  gid.gtk4.types.BaselinePosition getBaselinePosition() nothrow
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_box_layout_get_baseline_position(cast(GtkBoxLayout*)this._cPtr);
    gid.gtk4.types.BaselinePosition _retval = cast(gid.gtk4.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns whether the layout is set to be homogeneous.
      Returns: true if the layout is homogeneous
  */
  bool getHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_box_layout_get_homogeneous(cast(GtkBoxLayout*)this._cPtr);
    return _retval;
  }

  /**
      Returns the space that box_layout puts between children.
      Returns: the spacing of the layout
  */
  uint getSpacing() nothrow
  {
    uint _retval;
    _retval = gtk_box_layout_get_spacing(cast(GtkBoxLayout*)this._cPtr);
    return _retval;
  }

  /**
      Sets the index of the child that determines the baseline
      in vertical layout.
  
      Params:
        child = the child position, or -1
  */
  void setBaselineChild(int child) nothrow
  {
    gtk_box_layout_set_baseline_child(cast(GtkBoxLayout*)this._cPtr, child);
  }

  /**
      Sets the baseline position of a box layout.
      
      The baseline position affects only horizontal boxes with at least one
      baseline aligned child. If there is more vertical space available than
      requested, and the baseline is not allocated by the parent then the
      given position is used to allocate the baseline within the extra
      space available.
  
      Params:
        position = a [gid.gtk4.types.BaselinePosition]
  */
  void setBaselinePosition(gid.gtk4.types.BaselinePosition position) nothrow
  {
    gtk_box_layout_set_baseline_position(cast(GtkBoxLayout*)this._cPtr, position);
  }

  /**
      Sets whether the box layout will allocate the same
      size to all children.
  
      Params:
        homogeneous = true to set the box layout as homogeneous
  */
  void setHomogeneous(bool homogeneous) nothrow
  {
    gtk_box_layout_set_homogeneous(cast(GtkBoxLayout*)this._cPtr, homogeneous);
  }

  /**
      Sets how much spacing to put between children.
  
      Params:
        spacing = the spacing to apply between children
  */
  void setSpacing(uint spacing) nothrow
  {
    gtk_box_layout_set_spacing(cast(GtkBoxLayout*)this._cPtr, spacing);
  }
}

/// Fluent builder implementation template for [gid.gtk4.box_layout.BoxLayout]
class BoxLayoutGidBuilderImpl(T) : gid.gtk4.layout_manager.LayoutManagerGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `baselineChild` property.
      Params:
        propval = The child that determines the baseline of the box
          in vertical layout.
          
          If the child does baseline positioning, then its baseline
          is lined up with the baseline of the box. If it doesn't, then
          the bottom edge of the child is used.
      Returns: Builder instance for fluent chaining
  */
  T baselineChild(int propval) nothrow
  {
    return setProperty("baseline-child", propval);
  }

  /**
      Set `baselinePosition` property.
      Params:
        propval = The position of the allocated baseline within the extra space
          allocated to each child.
          
          This property is only relevant for horizontal layouts containing
          at least one child with a baseline alignment.
      Returns: Builder instance for fluent chaining
  */
  T baselinePosition(gid.gtk4.types.BaselinePosition propval) nothrow
  {
    return setProperty("baseline-position", propval);
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether the box layout should distribute the available space
          equally among the children.
      Returns: Builder instance for fluent chaining
  */
  T homogeneous(bool propval) nothrow
  {
    return setProperty("homogeneous", propval);
  }

  /**
      Set `spacing` property.
      Params:
        propval = The space to put between the children.
      Returns: Builder instance for fluent chaining
  */
  T spacing(int propval) nothrow
  {
    return setProperty("spacing", propval);
  }
}

/// Fluent builder for [gid.gtk4.box_layout.BoxLayout]
final class BoxLayoutGidBuilder : BoxLayoutGidBuilderImpl!BoxLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BoxLayout build() nothrow
  {
    return new BoxLayout(cast(void*)createGObject(BoxLayout._getGType), Yes.Take);
  }
}
