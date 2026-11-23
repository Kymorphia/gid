/// Module for [CenterLayout] class
module gid.gtk4.center_layout;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_manager;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Manages up to three children.
    
    The start widget is allocated at the start of the layout (left in
    left-to-right locales and right in right-to-left ones), and the end
    widget at the end.
    
    The center widget is centered regarding the full width of the layout's.
*/
class CenterLayout : gid.gtk4.layout_manager.LayoutManager
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
    return cast(void function())gtk_center_layout_get_type != &gidSymbolNotFound ? gtk_center_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCenterLayout";
  }

  /** Returns `this`, for use in `with` statements. */
  override CenterLayout self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.center_layout.CenterLayout]
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
      Creates a new [gid.gtk4.center_layout.CenterLayout].
      Returns: the newly created [gid.gtk4.center_layout.CenterLayout]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkLayoutManager* _cretval;
      _cretval = gtk_center_layout_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the baseline position of the layout.
      Returns: The current baseline position of self.
  */
  gid.gtk4.types.BaselinePosition getBaselinePosition() nothrow
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_center_layout_get_baseline_position(cast(GtkCenterLayout*)this._cPtr);
    gid.gtk4.types.BaselinePosition _retval = cast(gid.gtk4.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Returns the center widget of the layout.
      Returns: the current center widget of self
  */
  gid.gtk4.widget.Widget getCenterWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_layout_get_center_widget(cast(GtkCenterLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the end widget of the layout.
      Returns: the current end widget of self
  */
  gid.gtk4.widget.Widget getEndWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_layout_get_end_widget(cast(GtkCenterLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current orienration of the layout manager.
      Returns: The current orientation of self
  */
  gid.gtk4.types.Orientation getOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_center_layout_get_orientation(cast(GtkCenterLayout*)this._cPtr);
    gid.gtk4.types.Orientation _retval = cast(gid.gtk4.types.Orientation)_cretval;
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
  gid.gtk4.widget.Widget getStartWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_layout_get_start_widget(cast(GtkCenterLayout*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the new baseline position of self
  
      Params:
        baselinePosition = the new baseline position
  */
  void setBaselinePosition(gid.gtk4.types.BaselinePosition baselinePosition) nothrow
  {
    gtk_center_layout_set_baseline_position(cast(GtkCenterLayout*)this._cPtr, baselinePosition);
  }

  /**
      Sets the new center widget of self.
      
      To remove the existing center widget, pass null.
  
      Params:
        widget = the new center widget
  */
  void setCenterWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_center_layout_set_center_widget(cast(GtkCenterLayout*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the new end widget of self.
      
      To remove the existing center widget, pass null.
  
      Params:
        widget = the new end widget
  */
  void setEndWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_center_layout_set_end_widget(cast(GtkCenterLayout*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the orientation of self.
  
      Params:
        orientation = the new orientation
  */
  void setOrientation(gid.gtk4.types.Orientation orientation) nothrow
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
  void setStartWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_center_layout_set_start_widget(cast(GtkCenterLayout*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.center_layout.CenterLayout]
class CenterLayoutGidBuilderImpl(T) : gid.gtk4.layout_manager.LayoutManagerGidBuilderImpl!T
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

/// Fluent builder for [gid.gtk4.center_layout.CenterLayout]
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
