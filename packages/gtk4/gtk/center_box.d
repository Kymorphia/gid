/// Module for [CenterBox] class
module gtk.center_box;

import gid.gid;
import gobject.object;
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
    [gtk.center_box.CenterBox] arranges three children in a row, keeping the middle child
    centered as well as possible.
    
    ![An example GtkCenterBox](centerbox.png)
    
    To add children to [gtk.center_box.CenterBox], use [gtk.center_box.CenterBox.setStartWidget],
    [gtk.center_box.CenterBox.setCenterWidget] and
    [gtk.center_box.CenterBox.setEndWidget].
    
    The sizing and positioning of children can be influenced with the
    align and expand properties of the children.
    
    # GtkCenterBox as GtkBuildable
    
    The [gtk.center_box.CenterBox] implementation of the [gtk.buildable.Buildable] interface
    supports placing children in the 3 positions by specifying “start”, “center”
    or “end” as the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    [gtk.center_box.CenterBox] uses a single CSS node with the name “box”,
    
    The first child of the [gtk.center_box.CenterBox] will be allocated depending on the
    text direction, i.e. in left-to-right layouts it will be allocated on the
    left and in right-to-left layouts on the right.
    
    In vertical orientation, the nodes of the children are arranged from top to
    bottom.
    
    # Accessibility
    
    Until GTK 4.10, [gtk.center_box.CenterBox] used the [gtk.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gtk.center_box.CenterBox] uses the [gtk.types.AccessibleRole.Generic] role.
*/
class CenterBox : gtk.widget.Widget, gtk.orientable.Orientable
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
    return cast(void function())gtk_center_box_get_type != &gidSymbolNotFound ? gtk_center_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CenterBox self()
  {
    return this;
  }

  /**
      Get `baselinePosition` property.
      Returns: The position of the baseline aligned widget if extra space is available.
  */
  @property gtk.types.BaselinePosition baselinePosition()
  {
    return getBaselinePosition();
  }

  /**
      Set `baselinePosition` property.
      Params:
        propval = The position of the baseline aligned widget if extra space is available.
  */
  @property void baselinePosition(gtk.types.BaselinePosition propval)
  {
    return setBaselinePosition(propval);
  }

  /**
      Get `centerWidget` property.
      Returns: The widget that is placed at the center position.
  */
  @property gtk.widget.Widget centerWidget()
  {
    return getCenterWidget();
  }

  /**
      Set `centerWidget` property.
      Params:
        propval = The widget that is placed at the center position.
  */
  @property void centerWidget(gtk.widget.Widget propval)
  {
    return setCenterWidget(propval);
  }

  /**
      Get `endWidget` property.
      Returns: The widget that is placed at the end position.
        
        In vertical orientation, the end position is at the bottom.
        In horizontal orientation, the end position is at the trailing
        edge wrt. to the text direction.
  */
  @property gtk.widget.Widget endWidget()
  {
    return getEndWidget();
  }

  /**
      Set `endWidget` property.
      Params:
        propval = The widget that is placed at the end position.
          
          In vertical orientation, the end position is at the bottom.
          In horizontal orientation, the end position is at the trailing
          edge wrt. to the text direction.
  */
  @property void endWidget(gtk.widget.Widget propval)
  {
    return setEndWidget(propval);
  }

  /**
      Get `shrinkCenterLast` property.
      Returns: Whether to shrink the center widget after other children.
        
        By default, when there's no space to give all three children their
        natural widths, the start and end widgets start shrinking and the
        center child keeps natural width until they reach minimum width.
        
        If set to `FALSE`, start and end widgets keep natural width and the
        center widget starts shrinking instead.
  */
  @property bool shrinkCenterLast()
  {
    return getShrinkCenterLast();
  }

  /**
      Set `shrinkCenterLast` property.
      Params:
        propval = Whether to shrink the center widget after other children.
          
          By default, when there's no space to give all three children their
          natural widths, the start and end widgets start shrinking and the
          center child keeps natural width until they reach minimum width.
          
          If set to `FALSE`, start and end widgets keep natural width and the
          center widget starts shrinking instead.
  */
  @property void shrinkCenterLast(bool propval)
  {
    return setShrinkCenterLast(propval);
  }

  /**
      Get `startWidget` property.
      Returns: The widget that is placed at the start position.
        
        In vertical orientation, the start position is at the top.
        In horizontal orientation, the start position is at the leading
        edge wrt. to the text direction.
  */
  @property gtk.widget.Widget startWidget()
  {
    return getStartWidget();
  }

  /**
      Set `startWidget` property.
      Params:
        propval = The widget that is placed at the start position.
          
          In vertical orientation, the start position is at the top.
          In horizontal orientation, the start position is at the leading
          edge wrt. to the text direction.
  */
  @property void startWidget(gtk.widget.Widget propval)
  {
    return setStartWidget(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gtk.center_box.CenterBox].
      Returns: the new [gtk.center_box.CenterBox].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_box_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the value set by [gtk.center_box.CenterBox.setBaselinePosition].
      Returns: the baseline position
  */
  gtk.types.BaselinePosition getBaselinePosition()
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_center_box_get_baseline_position(cast(GtkCenterBox*)this._cPtr);
    gtk.types.BaselinePosition _retval = cast(gtk.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Gets the center widget, or null if there is none.
      Returns: the center widget.
  */
  gtk.widget.Widget getCenterWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_box_get_center_widget(cast(GtkCenterBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the end widget, or null if there is none.
      Returns: the end widget.
  */
  gtk.widget.Widget getEndWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_box_get_end_widget(cast(GtkCenterBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self shrinks the center widget after other children.
      Returns: whether to shrink the center widget after others
  */
  bool getShrinkCenterLast()
  {
    bool _retval;
    _retval = cast(bool)gtk_center_box_get_shrink_center_last(cast(GtkCenterBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the start widget, or null if there is none.
      Returns: the start widget.
  */
  gtk.widget.Widget getStartWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_box_get_start_widget(cast(GtkCenterBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the baseline position of a center box.
      
      This affects only horizontal boxes with at least one baseline
      aligned child. If there is more vertical space available than
      requested, and the baseline is not allocated by the parent then
      position is used to allocate the baseline wrt. the extra space
      available.
  
      Params:
        position = a [gtk.types.BaselinePosition]
  */
  void setBaselinePosition(gtk.types.BaselinePosition position)
  {
    gtk_center_box_set_baseline_position(cast(GtkCenterBox*)this._cPtr, position);
  }

  /**
      Sets the center widget.
      
      To remove the existing center widget, pass null.
  
      Params:
        child = the new center widget
  */
  void setCenterWidget(gtk.widget.Widget child = null)
  {
    gtk_center_box_set_center_widget(cast(GtkCenterBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the end widget.
      
      To remove the existing end widget, pass null.
  
      Params:
        child = the new end widget
  */
  void setEndWidget(gtk.widget.Widget child = null)
  {
    gtk_center_box_set_end_widget(cast(GtkCenterBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to shrink the center widget after other children.
      
      By default, when there's no space to give all three children their
      natural widths, the start and end widgets start shrinking and the
      center child keeps natural width until they reach minimum width.
      
      If set to `FALSE`, start and end widgets keep natural width and the
      center widget starts shrinking instead.
  
      Params:
        shrinkCenterLast = whether to shrink the center widget after others
  */
  void setShrinkCenterLast(bool shrinkCenterLast)
  {
    gtk_center_box_set_shrink_center_last(cast(GtkCenterBox*)this._cPtr, shrinkCenterLast);
  }

  /**
      Sets the start widget.
      
      To remove the existing start widget, pass null.
  
      Params:
        child = the new start widget
  */
  void setStartWidget(gtk.widget.Widget child = null)
  {
    gtk_center_box_set_start_widget(cast(GtkCenterBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}
