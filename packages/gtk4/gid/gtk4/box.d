/// Module for [Box] class
module gid.gtk4.box;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Arranges child widgets into a single row or column.
    
    <picture>
      <source srcset="box-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkBox" src="box.png">
    </picture>
    
    Whether it is a row or column depends on the value of its
    [gid.gtk4.orientable.Orientable.orientation] property. Within the other
    dimension, all children are allocated the same size. The
    [gid.gtk4.widget.Widget.halign] and [gid.gtk4.widget.Widget.valign]
    properties can be used on the children to influence their allocation.
    
    Use repeated calls to [gid.gtk4.box.Box.append] to pack widgets into a
    [gid.gtk4.box.Box] from start to end. Use [gid.gtk4.box.Box.remove] to remove widgets
    from the [gid.gtk4.box.Box]. [gid.gtk4.box.Box.insertChildAfter] can be used to add
    a child at a particular position.
    
    Use [gid.gtk4.box.Box.setHomogeneous] to specify whether or not all children
    of the [gid.gtk4.box.Box] are forced to get the same amount of space.
    
    Use [gid.gtk4.box.Box.setSpacing] to determine how much space will be minimally
    placed between all children in the [gid.gtk4.box.Box]. Note that spacing is added
    *between* the children.
    
    Use [gid.gtk4.box.Box.reorderChildAfter] to move a child to a different
    place in the box.
    
    # CSS nodes
    
    [gid.gtk4.box.Box] uses a single CSS node with name box.
    
    # Accessibility
    
    Until GTK 4.10, [gid.gtk4.box.Box] used the [gid.gtk4.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gid.gtk4.box.Box] uses the [gid.gtk4.types.AccessibleRole.Generic] role.
*/
class Box : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())gtk_box_get_type != &gidSymbolNotFound ? gtk_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override Box self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.box.Box]
      Returns: New builder object
  */
  static BoxGidBuilder builder() nothrow
  {
    return new BoxGidBuilder;
  }

  /**
      Get `baselineChild` property.
      Returns: The position of the child that determines the baseline.
        
        This is only relevant if the box is in vertical orientation.
  */
  @property int baselineChild() nothrow
  {
    return getBaselineChild();
  }

  /**
      Set `baselineChild` property.
      Params:
        propval = The position of the child that determines the baseline.
          
          This is only relevant if the box is in vertical orientation.
  */
  @property void baselineChild(int propval) nothrow
  {
    setBaselineChild(propval);
  }

  /**
      Get `baselinePosition` property.
      Returns: How to position baseline-aligned widgets if extra space is available.
  */
  @property gid.gtk4.types.BaselinePosition baselinePosition() nothrow
  {
    return getBaselinePosition();
  }

  /**
      Set `baselinePosition` property.
      Params:
        propval = How to position baseline-aligned widgets if extra space is available.
  */
  @property void baselinePosition(gid.gtk4.types.BaselinePosition propval) nothrow
  {
    setBaselinePosition(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Whether the children should all be the same size.
  */
  @property bool homogeneous() nothrow
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether the children should all be the same size.
  */
  @property void homogeneous(bool propval) nothrow
  {
    setHomogeneous(propval);
  }

  /**
      Get `spacing` property.
      Returns: The amount of space between children.
  */
  @property int spacing() nothrow
  {
    return getSpacing();
  }

  /**
      Set `spacing` property.
      Params:
        propval = The amount of space between children.
  */
  @property void spacing(int propval) nothrow
  {
    setSpacing(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new box.
  
      Params:
        orientation = the box’s orientation
        spacing = the number of pixels to place between children
      Returns: a new [gid.gtk4.box.Box].
  */
  this(gid.gtk4.types.Orientation orientation, int spacing) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_box_new(orientation, spacing);
    this(_cretval, No.Take);
  }

  /**
      Adds a child at the end.
  
      Params:
        child = the widget to append
  */
  void append(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_box_append(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets the value set by [gid.gtk4.box.Box.setBaselineChild].
      Returns: the baseline child
  */
  int getBaselineChild() nothrow
  {
    int _retval;
    _retval = gtk_box_get_baseline_child(cast(GtkBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.box.Box.setBaselinePosition].
      Returns: the baseline position
  */
  gid.gtk4.types.BaselinePosition getBaselinePosition() nothrow
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_box_get_baseline_position(cast(GtkBox*)this._cPtr);
    gid.gtk4.types.BaselinePosition _retval = cast(gid.gtk4.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns whether the box is homogeneous.
      
      In a homogeneous box all children are the same size.
      Returns: true if the box is homogeneous
  */
  bool getHomogeneous() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_box_get_homogeneous(cast(GtkBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.box.Box.setSpacing].
      Returns: spacing between children
  */
  int getSpacing() nothrow
  {
    int _retval;
    _retval = gtk_box_get_spacing(cast(GtkBox*)this._cPtr);
    return _retval;
  }

  /**
      Inserts a child at a specific position.
      
      The child is added after sibling in the list of box children.
      
      If sibling is `NULL`, the child is placed at the beginning.
  
      Params:
        child = the widget to insert
        sibling = the sibling after which to insert child
  */
  void insertChildAfter(gid.gtk4.widget.Widget child, gid.gtk4.widget.Widget sibling = null) nothrow
  {
    gtk_box_insert_child_after(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Adds a child at the beginning.
  
      Params:
        child = the widget to prepend
  */
  void prepend(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_box_prepend(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child widget from the box.
      
      The child must have been added before with
      [gid.gtk4.box.Box.append], [gid.gtk4.box.Box.prepend], or
      [gid.gtk4.box.Box.insertChildAfter].
  
      Params:
        child = the child to remove
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_box_remove(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Moves a child to a different position.
      
      The child is moved to the position after sibling in the list
      of box children.
      
      If sibling is `NULL`, the child is placed at the beginning.
  
      Params:
        child = the widget to move, must be a child of box
        sibling = the sibling to move child after
  */
  void reorderChildAfter(gid.gtk4.widget.Widget child, gid.gtk4.widget.Widget sibling = null) nothrow
  {
    gtk_box_reorder_child_after(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Sets the baseline child of a box.
      
      This affects only vertical boxes.
  
      Params:
        child = a child position, or -1
  */
  void setBaselineChild(int child) nothrow
  {
    gtk_box_set_baseline_child(cast(GtkBox*)this._cPtr, child);
  }

  /**
      Sets the baseline position of a box.
      
      This affects only horizontal boxes with at least one baseline
      aligned child. If there is more vertical space available than
      requested, and the baseline is not allocated by the parent then
      position is used to allocate the baseline with respect to the
      extra space available.
  
      Params:
        position = the baseline position
  */
  void setBaselinePosition(gid.gtk4.types.BaselinePosition position) nothrow
  {
    gtk_box_set_baseline_position(cast(GtkBox*)this._cPtr, position);
  }

  /**
      Sets whether or not all children are given equal space
      in the box.
  
      Params:
        homogeneous = true to create equal allotments,
            false for variable allotments
  */
  void setHomogeneous(bool homogeneous) nothrow
  {
    gtk_box_set_homogeneous(cast(GtkBox*)this._cPtr, homogeneous);
  }

  /**
      Sets the number of pixels to place between children.
  
      Params:
        spacing = the number of pixels to put between children
  */
  void setSpacing(int spacing) nothrow
  {
    gtk_box_set_spacing(cast(GtkBox*)this._cPtr, spacing);
  }
}

/// Fluent builder implementation template for [gid.gtk4.box.Box]
class BoxGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `baselineChild` property.
      Params:
        propval = The position of the child that determines the baseline.
          
          This is only relevant if the box is in vertical orientation.
      Returns: Builder instance for fluent chaining
  */
  T baselineChild(int propval) nothrow
  {
    return setProperty("baseline-child", propval);
  }

  /**
      Set `baselinePosition` property.
      Params:
        propval = How to position baseline-aligned widgets if extra space is available.
      Returns: Builder instance for fluent chaining
  */
  T baselinePosition(gid.gtk4.types.BaselinePosition propval) nothrow
  {
    return setProperty("baseline-position", propval);
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether the children should all be the same size.
      Returns: Builder instance for fluent chaining
  */
  T homogeneous(bool propval) nothrow
  {
    return setProperty("homogeneous", propval);
  }

  /**
      Set `spacing` property.
      Params:
        propval = The amount of space between children.
      Returns: Builder instance for fluent chaining
  */
  T spacing(int propval) nothrow
  {
    return setProperty("spacing", propval);
  }
}

/// Fluent builder for [gid.gtk4.box.Box]
final class BoxGidBuilder : BoxGidBuilderImpl!BoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Box build() nothrow
  {
    return new Box(cast(void*)createGObject(Box._getGType), Yes.Take);
  }
}
