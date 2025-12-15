/// Module for [Box] class
module gtk.box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    The GtkBox widget arranges child widgets into a single row or column,
    depending upon the value of its #GtkOrientable:orientation property. Within
    the other dimension, all children are allocated the same size. Of course,
    the #GtkWidget:halign and #GtkWidget:valign properties can be used on
    the children to influence their allocation.
    
    GtkBox uses a notion of packing. Packing refers
    to adding widgets with reference to a particular position in a
    #GtkContainer. For a GtkBox, there are two reference positions: the
    start and the end of the box.
    For a vertical #GtkBox, the start is defined as the top of the box and
    the end is defined as the bottom. For a horizontal #GtkBox the start
    is defined as the left side and the end is defined as the right side.
    
    Use repeated calls to [gtk.box.Box.packStart] to pack widgets into a
    GtkBox from start to end. Use [gtk.box.Box.packEnd] to add widgets from
    end to start. You may intersperse these calls and add widgets from
    both ends of the same GtkBox.
    
    Because GtkBox is a #GtkContainer, you may also use [gtk.container.Container.add]
    to insert widgets into the box, and they will be packed with the default
    values for expand and fill child properties. Use [gtk.container.Container.remove]
    to remove widgets from the GtkBox.
    
    Use [gtk.box.Box.setHomogeneous] to specify whether or not all children
    of the GtkBox are forced to get the same amount of space.
    
    Use [gtk.box.Box.setSpacing] to determine how much space will be
    minimally placed between all children in the GtkBox. Note that
    spacing is added between the children, while
    padding added by [gtk.box.Box.packStart] or [gtk.box.Box.packEnd] is added
    on either side of the widget it belongs to.
    
    Use [gtk.box.Box.reorderChild] to move a GtkBox child to a different
    place in the box.
    
    Use [gtk.box.Box.setChildPacking] to reset the expand,
    fill and padding child properties.
    Use [gtk.box.Box.queryChildPacking] to query these fields.
    
    # CSS nodes
    
    GtkBox uses a single CSS node with name box.
    
    In horizontal orientation, the nodes of the children are always arranged
    from left to right. So :first-child will always select the leftmost child,
    regardless of text direction.
*/
class Box : gtk.container.Container, gtk.orientable.Orientable
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

  /** */
  @property gtk.types.BaselinePosition baselinePosition()
  {
    return getBaselinePosition();
  }

  /** */
  @property void baselinePosition(gtk.types.BaselinePosition propval)
  {
    return setBaselinePosition(propval);
  }

  /** */
  @property bool homogeneous()
  {
    return getHomogeneous();
  }

  /** */
  @property void homogeneous(bool propval)
  {
    return setHomogeneous(propval);
  }

  /** */
  @property int spacing()
  {
    return getSpacing();
  }

  /** */
  @property void spacing(int propval)
  {
    return setSpacing(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkBox.
  
      Params:
        orientation = the box’s orientation.
        spacing = the number of pixels to place by default between children.
      Returns: a new #GtkBox.
  */
  this(gtk.types.Orientation orientation, int spacing)
  {
    GtkWidget* _cretval;
    _cretval = gtk_box_new(orientation, spacing);
    this(_cretval, No.Take);
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
      Retrieves the center widget of the box.
      Returns: the center widget
          or null in case no center widget is set.
  */
  gtk.widget.Widget getCenterWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_box_get_center_widget(cast(GtkBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the box is homogeneous (all children are the
      same size). See [gtk.box.Box.setHomogeneous].
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
      Adds child to box, packed with reference to the end of box.
      The child is packed after (away from end of) any other child
      packed with reference to the end of box.
  
      Params:
        child = the #GtkWidget to be added to box
        expand = true if the new child is to be given extra space allocated
            to box. The extra space will be divided evenly between all children
            of box that use this option
        fill = true if space given to child by the expand option is
            actually allocated to child, rather than just padding it.  This
            parameter has no effect if expand is set to false.  A child is
            always allocated the full height of a horizontal #GtkBox and the full width
            of a vertical #GtkBox.  This option affects the other dimension
        padding = extra space in pixels to put between this child and its
            neighbors, over and above the global amount specified by
            #GtkBox:spacing property.  If child is a widget at one of the
            reference ends of box, then padding pixels are also put between
            child and the reference edge of box
  */
  void packEnd(gtk.widget.Widget child, bool expand, bool fill, uint padding)
  {
    gtk_box_pack_end(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, expand, fill, padding);
  }

  /**
      Adds child to box, packed with reference to the start of box.
      The child is packed after any other child packed with reference
      to the start of box.
  
      Params:
        child = the #GtkWidget to be added to box
        expand = true if the new child is to be given extra space allocated
              to box. The extra space will be divided evenly between all children
              that use this option
        fill = true if space given to child by the expand option is
              actually allocated to child, rather than just padding it.  This
              parameter has no effect if expand is set to false.  A child is
              always allocated the full height of a horizontal #GtkBox and the full width
              of a vertical #GtkBox. This option affects the other dimension
        padding = extra space in pixels to put between this child and its
            neighbors, over and above the global amount specified by
            #GtkBox:spacing property.  If child is a widget at one of the
            reference ends of box, then padding pixels are also put between
            child and the reference edge of box
  */
  void packStart(gtk.widget.Widget child, bool expand, bool fill, uint padding)
  {
    gtk_box_pack_start(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, expand, fill, padding);
  }

  /**
      Obtains information about how child is packed into box.
  
      Params:
        child = the #GtkWidget of the child to query
        expand = pointer to return location for expand child
              property
        fill = pointer to return location for fill child
              property
        padding = pointer to return location for padding
              child property
        packType = pointer to return location for pack-type
              child property
  */
  void queryChildPacking(gtk.widget.Widget child, out bool expand, out bool fill, out uint padding, out gtk.types.PackType packType)
  {
    gboolean _expand;
    gboolean _fill;
    gtk_box_query_child_packing(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, &_expand, &_fill, cast(uint*)&padding, &packType);
    expand = cast(bool)_expand;
    fill = cast(bool)_fill;
  }

  /**
      Moves child to a new position in the list of box children.
      The list contains widgets packed #GTK_PACK_START
      as well as widgets packed #GTK_PACK_END, in the order that these
      widgets were added to box.
      
      A widget’s position in the box children list determines where
      the widget is packed into box.  A child widget at some position
      in the list will be packed just after all other widgets of the
      same packing type that appear earlier in the list.
  
      Params:
        child = the #GtkWidget to move
        position = the new position for child in the list of children
            of box, starting from 0. If negative, indicates the end of
            the list
  */
  void reorderChild(gtk.widget.Widget child, int position)
  {
    gtk_box_reorder_child(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Sets the baseline position of a box. This affects
      only horizontal boxes with at least one baseline aligned
      child. If there is more vertical space available than requested,
      and the baseline is not allocated by the parent then
      position is used to allocate the baseline wrt the
      extra space available.
  
      Params:
        position = a #GtkBaselinePosition
  */
  void setBaselinePosition(gtk.types.BaselinePosition position)
  {
    gtk_box_set_baseline_position(cast(GtkBox*)this._cPtr, position);
  }

  /**
      Sets a center widget; that is a child widget that will be
      centered with respect to the full width of the box, even
      if the children at either side take up different amounts
      of space.
  
      Params:
        widget = the widget to center
  */
  void setCenterWidget(gtk.widget.Widget widget = null)
  {
    gtk_box_set_center_widget(cast(GtkBox*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the way child is packed into box.
  
      Params:
        child = the #GtkWidget of the child to set
        expand = the new value of the expand child property
        fill = the new value of the fill child property
        padding = the new value of the padding child property
        packType = the new value of the pack-type child property
  */
  void setChildPacking(gtk.widget.Widget child, bool expand, bool fill, uint padding, gtk.types.PackType packType)
  {
    gtk_box_set_child_packing(cast(GtkBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, expand, fill, padding, packType);
  }

  /**
      Sets the #GtkBox:homogeneous property of box, controlling
      whether or not all children of box are given equal space
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
      Sets the #GtkBox:spacing property of box, which is the
      number of pixels to place between children of box.
  
      Params:
        spacing = the number of pixels to put between children
  */
  void setSpacing(int spacing)
  {
    gtk_box_set_spacing(cast(GtkBox*)this._cPtr, spacing);
  }
}
