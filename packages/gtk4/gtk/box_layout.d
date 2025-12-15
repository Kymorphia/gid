/// Module for [BoxLayout] class
module gtk.box_layout;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    [gtk.box_layout.BoxLayout] is a layout manager that arranges children in a single
    row or column.
    
    Whether it is a row or column depends on the value of its
    [gtk.orientable.Orientable.orientation] property. Within the other dimension
    all children all allocated the same size. The [gtk.box_layout.BoxLayout] will respect
    the [gtk.widget.Widget.halign] and [gtk.widget.Widget.valign]
    properties of each child widget.
    
    If you want all children to be assigned the same size, you can use
    the [gtk.box_layout.BoxLayout.homogeneous] property.
    
    If you want to specify the amount of space placed between each child,
    you can use the [gtk.box_layout.BoxLayout.spacing] property.
*/
class BoxLayout : gtk.layout_manager.LayoutManager, gtk.orientable.Orientable
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
    return cast(void function())gtk_box_layout_get_type != &gidSymbolNotFound ? gtk_box_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BoxLayout self()
  {
    return this;
  }

  /**
      Get `baselineChild` property.
      Returns: The child that determines the baseline of the box
      in vertical layout.
      
      If the child does baseline positioning, then its baseline
      is lined up with the baseline of the box. If it doesn't, then
      the bottom edge of the child is used.
  */
  @property int baselineChild()
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
  @property void baselineChild(int propval)
  {
    return setBaselineChild(propval);
  }

  /**
      Get `baselinePosition` property.
      Returns: The position of the allocated baseline within the extra space
      allocated to each child.
      
      This property is only relevant for horizontal layouts containing
      at least one child with a baseline alignment.
  */
  @property gtk.types.BaselinePosition baselinePosition()
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
  @property void baselinePosition(gtk.types.BaselinePosition propval)
  {
    return setBaselinePosition(propval);
  }

  /**
      Get `homogeneous` property.
      Returns: Whether the box layout should distribute the available space
      equally among the children.
  */
  @property bool homogeneous()
  {
    return getHomogeneous();
  }

  /**
      Set `homogeneous` property.
      Params:
        propval = Whether the box layout should distribute the available space
        equally among the children.
  */
  @property void homogeneous(bool propval)
  {
    return setHomogeneous(propval);
  }

  /**
      Get `spacing` property.
      Returns: The space to put between the children.
  */
  @property int spacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("spacing");
  }

  /**
      Set `spacing` property.
      Params:
        propval = The space to put between the children.
  */
  @property void spacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("spacing", propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gtk.box_layout.BoxLayout].
  
      Params:
        orientation = the orientation for the new layout
      Returns: a new box layout
  */
  this(gtk.types.Orientation orientation)
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_box_layout_new(orientation);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the value set by [gtk.box_layout.BoxLayout.setBaselineChild].
      Returns: the index of the child that determines the baseline
            in vertical layout, or -1
  */
  int getBaselineChild()
  {
    int _retval;
    _retval = gtk_box_layout_get_baseline_child(cast(GtkBoxLayout*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.box_layout.BoxLayout.setBaselinePosition].
      Returns: the baseline position
  */
  gtk.types.BaselinePosition getBaselinePosition()
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_box_layout_get_baseline_position(cast(GtkBoxLayout*)this._cPtr);
    gtk.types.BaselinePosition _retval = cast(gtk.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns whether the layout is set to be homogeneous.
      Returns: true if the layout is homogeneous
  */
  bool getHomogeneous()
  {
    bool _retval;
    _retval = cast(bool)gtk_box_layout_get_homogeneous(cast(GtkBoxLayout*)this._cPtr);
    return _retval;
  }

  /**
      Returns the space that box_layout puts between children.
      Returns: the spacing of the layout
  */
  uint getSpacing()
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
  void setBaselineChild(int child)
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
        position = a [gtk.types.BaselinePosition]
  */
  void setBaselinePosition(gtk.types.BaselinePosition position)
  {
    gtk_box_layout_set_baseline_position(cast(GtkBoxLayout*)this._cPtr, position);
  }

  /**
      Sets whether the box layout will allocate the same
      size to all children.
  
      Params:
        homogeneous = true to set the box layout as homogeneous
  */
  void setHomogeneous(bool homogeneous)
  {
    gtk_box_layout_set_homogeneous(cast(GtkBoxLayout*)this._cPtr, homogeneous);
  }

  /**
      Sets how much spacing to put between children.
  
      Params:
        spacing = the spacing to apply between children
  */
  void setSpacing(uint spacing)
  {
    gtk_box_layout_set_spacing(cast(GtkBoxLayout*)this._cPtr, spacing);
  }
}
