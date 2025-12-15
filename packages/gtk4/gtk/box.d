/// Module for [Box] class
module gtk.box;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.box.Box] widget arranges child widgets into a single row or column.
    
    ![An example GtkBox](box.png)
    
    Whether it is a row or column depends on the value of its
    [gtk.orientable.Orientable.orientation] property. Within the other
    dimension, all children are allocated the same size. Of course, the
    [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign] properties
    can be used on the children to influence their allocation.
    
    Use repeated calls to [gtk.box.Box.append] to pack widgets into a
    [gtk.box.Box] from start to end. Use [gtk.box.Box.remove] to remove widgets
    from the [gtk.box.Box]. [gtk.box.Box.insertChildAfter] can be used to add
    a child at a particular position.
    
    Use [gtk.box.Box.setHomogeneous] to specify whether or not all children
    of the [gtk.box.Box] are forced to get the same amount of space.
    
    Use [gtk.box.Box.setSpacing] to determine how much space will be minimally
    placed between all children in the [gtk.box.Box]. Note that spacing is added
    *between* the children.
    
    Use [gtk.box.Box.reorderChildAfter] to move a child to a different
    place in the box.
    
    # CSS nodes
    
    [gtk.box.Box] uses a single CSS node with name box.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.box.Box] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.box.Box] uses the [gtk.types.AccessibleRole.Generic] role.
*/
class Box : gtk.widget.Widget, gtk.orientable.Orientable
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_box_get_type != &gidSymbolNotFound ? gtk_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Box self()
  {
    return this;
  }

  /**
      Get `baselineChild` property.
      Returns: The child that determines the baseline, in vertical orientation.
  */
  @property int baselineChild()
  {
    return getBaselineChild();
  }

  /**
      Set `baselineChild` property.
      Params:
        propval = The child that determines the baseline, in vertical orientation.
  */
  @property void baselineChild(int propval)
  {
    return setBaselineChild(propval);
  }

  /**
      Get `baselinePosition` property.
      Returns: The position of the baseline aligned widgets if extra space is available.
  */
  @property gtk.types.BaselinePosition baselinePosition()
  {
    return getBaselinePosition();
  }

  /**
      Set `baselinePosition` property.
      Params:
        propval = The position of the baseline aligned widgets if extra space is available.
  */
  @property void baselinePosition(gtk.types.BaselinePosition propval)
  {
    return setBaselinePosition(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Whether the children should all be the same size.
  */
  @property bool homogeneous()
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether the children should all be the same size.
  */
  @property void homogeneous(bool propval)
  {
    return setHomogeneous(propval);
  }

  /**
      Get `spacing` property.
      Returns: The amount of space between children.
  */
  @property int spacing()
  {
    return getSpacing();
  }

  /**
      Set `spacing` property.
      Params:
        propval = The amount of space between children.
  */
  @property void spacing(int propval)
  {
    return setSpacing(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gtk.box.Box].
  
      Params:
        orientation = the box’s orientation
        spacing = the number of pixels to place by default between children
      Returns: a new [gtk.box.Box].
  */
  this(gtk.types.Orientation orientation, int spacing)
  {
    GtkWidget* _cretval;
    _cretval = gtk_box_new(orientation, spacing);
    this(_cretval, No.Take);
  }

  /**
      Adds child as the last child to box.
  
      Params:
        child = the [gtk.widget.Widget] to append
  */
  void append(gtk.widget.Widget child)
  {
    gtk_box_append(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Gets the value set by [gtk.box.Box.setBaselineChild].
      Returns: the baseline child
  */
  int getBaselineChild()
  {
    int _retval;
    _retval = gtk_box_get_baseline_child(cast(GtkBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.box.Box.setBaselinePosition].
      Returns: the baseline position
  */
  gtk.types.BaselinePosition getBaselinePosition()
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_box_get_baseline_position(cast(GtkBox*)this._cPtr);
    gtk.types.BaselinePosition _retval = cast(gtk.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns whether the box is homogeneous (all children are the
      same size).
      Returns: true if the box is homogeneous.
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_box_get_homogeneous(cast(GtkBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.box.Box.setSpacing].
      Returns: spacing between children
  */
  int getSpacing()
  {
    int _retval;
    _retval = gtk_box_get_spacing(cast(GtkBox*)this._cPtr);
    return _retval;
  }

  /**
      Inserts child in the position after sibling in the list
      of box children.
      
      If sibling is null, insert child at the first position.
  
      Params:
        child = the [gtk.widget.Widget] to insert
        sibling = the sibling after which to insert child
  */
  void insertChildAfter(gtk.widget.Widget child, gtk.widget.Widget sibling = null)
  {
    gtk_box_insert_child_after(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Adds child as the first child to box.
  
      Params:
        child = the [gtk.widget.Widget] to prepend
  */
  void prepend(gtk.widget.Widget child)
  {
    gtk_box_prepend(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child widget from box.
      
      The child must have been added before with
      [gtk.box.Box.append], [gtk.box.Box.prepend], or
      [gtk.box.Box.insertChildAfter].
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child)
  {
    gtk_box_remove(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Moves child to the position after sibling in the list
      of box children.
      
      If sibling is null, move child to the first position.
  
      Params:
        child = the [gtk.widget.Widget] to move, must be a child of box
        sibling = the sibling to move child after
  */
  void reorderChildAfter(gtk.widget.Widget child, gtk.widget.Widget sibling = null)
  {
    gtk_box_reorder_child_after(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, sibling ? cast(GtkWidget*)sibling._cPtr(No.Dup) : null);
  }

  /**
      Sets the baseline child of a box.
      
      This affects only vertical boxes.
  
      Params:
        child = a child, or -1
  */
  void setBaselineChild(int child)
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
        position = a [gtk.types.BaselinePosition]
  */
  void setBaselinePosition(gtk.types.BaselinePosition position)
  {
    gtk_box_set_baseline_position(cast(GtkBox*)this._cPtr, position);
  }

  /**
      Sets whether or not all children of box are given equal space
      in the box.
  
      Params:
        homogeneous = a boolean value, true to create equal allotments,
            false for variable allotments
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_box_set_homogeneous(cast(GtkBox*)this._cPtr, homogeneous);
  }

  /**
      Sets the number of pixels to place between children of box.
  
      Params:
        spacing = the number of pixels to put between children
  */
  void setSpacing(int spacing)
  {
    gtk_box_set_spacing(cast(GtkBox*)this._cPtr, spacing);
  }
}
