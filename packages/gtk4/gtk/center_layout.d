/// Module for [CenterLayout] class
module gtk.center_layout;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;
import gtk.widget;

/**
    [gtk.center_layout.CenterLayout] is a layout manager that manages up to three children.
    
    The start widget is allocated at the start of the layout (left in
    left-to-right locales and right in right-to-left ones), and the end
    widget at the end.
    
    The center widget is centered regarding the full width of the layout's.
*/
class CenterLayout : gtk.layout_manager.LayoutManager
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_center_layout_get_type != &gidSymbolNotFound ? gtk_center_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CenterLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.center_layout.CenterLayout]
      Returns: New builder object
  */
  static CenterLayoutGidBuilder builder() nothrow
  {
    return new CenterLayoutGidBuilder;
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
  @property bool shrinkCenterLast() nothrow
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
  @property void shrinkCenterLast(bool propval) nothrow
  {
    setShrinkCenterLast(propval);
  }

  /**
      Creates a new [gtk.center_layout.CenterLayout].
      Returns: the newly created [gtk.center_layout.CenterLayout]
  */
  this() nothrow
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_center_layout_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the baseline position of the layout.
      Returns: The current baseline position of self.
  */
  gtk.types.BaselinePosition getBaselinePosition() nothrow
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_center_layout_get_baseline_position(cast(GtkCenterLayout*)this._cPtr);
    gtk.types.BaselinePosition _retval = cast(gtk.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns the center widget of the layout.
      Returns: the current center widget of self
  */
  gtk.widget.Widget getCenterWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_layout_get_center_widget(cast(GtkCenterLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the end widget of the layout.
      Returns: the current end widget of self
  */
  gtk.widget.Widget getEndWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_layout_get_end_widget(cast(GtkCenterLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current orienration of the layout manager.
      Returns: The current orientation of self
  */
  gtk.types.Orientation getOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_center_layout_get_orientation(cast(GtkCenterLayout*)this._cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Gets whether self shrinks the center widget after other children.
      Returns: whether to shrink the center widget after others
  */
  bool getShrinkCenterLast() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_center_layout_get_shrink_center_last(cast(GtkCenterLayout*)this._cPtr);
    return _retval;
  }

  /**
      Returns the start widget of the layout.
      Returns: The current start widget of self
  */
  gtk.widget.Widget getStartWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_layout_get_start_widget(cast(GtkCenterLayout*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the new baseline position of self
  
      Params:
        baselinePosition = the new baseline position
  */
  void setBaselinePosition(gtk.types.BaselinePosition baselinePosition) nothrow
  {
    gtk_center_layout_set_baseline_position(cast(GtkCenterLayout*)this._cPtr, baselinePosition);
  }

  /**
      Sets the new center widget of self.
      
      To remove the existing center widget, pass null.
  
      Params:
        widget = the new center widget
  */
  void setCenterWidget(gtk.widget.Widget widget = null) nothrow
  {
    gtk_center_layout_set_center_widget(cast(GtkCenterLayout*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the new end widget of self.
      
      To remove the existing center widget, pass null.
  
      Params:
        widget = the new end widget
  */
  void setEndWidget(gtk.widget.Widget widget = null) nothrow
  {
    gtk_center_layout_set_end_widget(cast(GtkCenterLayout*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the orientation of self.
  
      Params:
        orientation = the new orientation
  */
  void setOrientation(gtk.types.Orientation orientation) nothrow
  {
    gtk_center_layout_set_orientation(cast(GtkCenterLayout*)this._cPtr, orientation);
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
  void setShrinkCenterLast(bool shrinkCenterLast) nothrow
  {
    gtk_center_layout_set_shrink_center_last(cast(GtkCenterLayout*)this._cPtr, shrinkCenterLast);
  }

  /**
      Sets the new start widget of self.
      
      To remove the existing start widget, pass null.
  
      Params:
        widget = the new start widget
  */
  void setStartWidget(gtk.widget.Widget widget = null) nothrow
  {
    gtk_center_layout_set_start_widget(cast(GtkCenterLayout*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.center_layout.CenterLayout]
class CenterLayoutGidBuilderImpl(T) : gtk.layout_manager.LayoutManagerGidBuilderImpl!T
{

  /**
      Set `shrinkCenterLast` property.
      Params:
        propval = Whether to shrink the center widget after other children.
          
          By default, when there's no space to give all three children their
          natural widths, the start and end widgets start shrinking and the
          center child keeps natural width until they reach minimum width.
          
          If set to `FALSE`, start and end widgets keep natural width and the
          center widget starts shrinking instead.
      Returns: Builder instance for fluent chaining
  */
  T shrinkCenterLast(bool propval) nothrow
  {
    return setProperty("shrink-center-last", propval);
  }
}

/// Fluent builder for [gtk.center_layout.CenterLayout]
final class CenterLayoutGidBuilder : CenterLayoutGidBuilderImpl!CenterLayoutGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CenterLayout build() nothrow
  {
    return new CenterLayout(cast(void*)createGObject(CenterLayout._getGType), Yes.Take);
  }
}
