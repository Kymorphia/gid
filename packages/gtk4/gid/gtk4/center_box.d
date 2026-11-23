/// Module for [CenterBox] class
module gid.gtk4.center_box;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
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
    Arranges three children in a row, keeping the middle child
    centered as well as possible.
    
    <picture>
      <source srcset="centerbox-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkCenterBox" src="centerbox.png">
    </picture>
    
    To add children to [gid.gtk4.center_box.CenterBox], use [gid.gtk4.center_box.CenterBox.setStartWidget],
    [gid.gtk4.center_box.CenterBox.setCenterWidget] and
    [gid.gtk4.center_box.CenterBox.setEndWidget].
    
    The sizing and positioning of children can be influenced with the
    align and expand properties of the children.
    
    # GtkCenterBox as GtkBuildable
    
    The [gid.gtk4.center_box.CenterBox] implementation of the [gid.gtk4.buildable.Buildable] interface
    supports placing children in the 3 positions by specifying “start”, “center”
    or “end” as the “type” attribute of a `<child>` element.
    
    # CSS nodes
    
    [gid.gtk4.center_box.CenterBox] uses a single CSS node with the name “box”,
    
    The first child of the [gid.gtk4.center_box.CenterBox] will be allocated depending on the
    text direction, i.e. in left-to-right layouts it will be allocated on the
    left and in right-to-left layouts on the right.
    
    In vertical orientation, the nodes of the children are arranged from top to
    bottom.
    
    # Accessibility
    
    Until GTK 4.10, [gid.gtk4.center_box.CenterBox] used the [gid.gtk4.types.AccessibleRole.Group] role.
    
    Starting from GTK 4.12, [gid.gtk4.center_box.CenterBox] uses the [gid.gtk4.types.AccessibleRole.Generic]
    role.
*/
class CenterBox : gid.gtk4.widget.Widget, gid.gtk4.orientable.Orientable
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
    return cast(void function())gtk_center_box_get_type != &gidSymbolNotFound ? gtk_center_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCenterBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override CenterBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.center_box.CenterBox]
      Returns: New builder object
  */
  static CenterBoxGidBuilder builder() nothrow
  {
    return new CenterBoxGidBuilder;
  }

  /**
      Get `baselinePosition` property.
      Returns: The position of the baseline aligned widget if extra space is available.
  */
  @property gid.gtk4.types.BaselinePosition baselinePosition() nothrow
  {
    return getBaselinePosition();
  }

  /**
      Set `baselinePosition` property.
      Params:
        propval = The position of the baseline aligned widget if extra space is available.
  */
  @property void baselinePosition(gid.gtk4.types.BaselinePosition propval) nothrow
  {
    setBaselinePosition(propval);
  }

  /**
      Get `centerWidget` property.
      Returns: The widget that is placed at the center position.
  */
  @property gid.gtk4.widget.Widget centerWidget() nothrow
  {
    return getCenterWidget();
  }

  /**
      Set `centerWidget` property.
      Params:
        propval = The widget that is placed at the center position.
  */
  @property void centerWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setCenterWidget(propval);
  }

  /**
      Get `endWidget` property.
      Returns: The widget that is placed at the end position.
        
        In vertical orientation, the end position is at the bottom.
        In horizontal orientation, the end position is at the trailing
        edge with respect to the text direction.
  */
  @property gid.gtk4.widget.Widget endWidget() nothrow
  {
    return getEndWidget();
  }

  /**
      Set `endWidget` property.
      Params:
        propval = The widget that is placed at the end position.
          
          In vertical orientation, the end position is at the bottom.
          In horizontal orientation, the end position is at the trailing
          edge with respect to the text direction.
  */
  @property void endWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setEndWidget(propval);
  }

  /**
      Get `shrinkCenterLast` property.
      Returns: Whether to shrink the center widget after other children.
        
        By default, when there's no space to give all three children their
        natural widths, the start and end widgets start shrinking and the
        center child keeps natural width until they reach minimum width.
        
        If false, start and end widgets keep natural width and the
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
          
          If false, start and end widgets keep natural width and the
          center widget starts shrinking instead.
  */
  @property void shrinkCenterLast(bool propval) nothrow
  {
    setShrinkCenterLast(propval);
  }

  /**
      Get `startWidget` property.
      Returns: The widget that is placed at the start position.
        
        In vertical orientation, the start position is at the top.
        In horizontal orientation, the start position is at the leading
        edge with respect to the text direction.
  */
  @property gid.gtk4.widget.Widget startWidget() nothrow
  {
    return getStartWidget();
  }

  /**
      Set `startWidget` property.
      Params:
        propval = The widget that is placed at the start position.
          
          In vertical orientation, the start position is at the top.
          In horizontal orientation, the start position is at the leading
          edge with respect to the text direction.
  */
  @property void startWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setStartWidget(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new [gid.gtk4.center_box.CenterBox].
      Returns: the new [gid.gtk4.center_box.CenterBox]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_center_box_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the baseline position of the center box.
      
      See [gid.gtk4.center_box.CenterBox.setBaselinePosition].
      Returns: the baseline position
  */
  gid.gtk4.types.BaselinePosition getBaselinePosition() nothrow
  {
    GtkBaselinePosition _cretval;
    _cretval = gtk_center_box_get_baseline_position(cast(GtkCenterBox*)this._cPtr);
    gid.gtk4.types.BaselinePosition _retval = cast(gid.gtk4.types.BaselinePosition)_cretval;
    return _retval;
  }

  /**
      Gets the center widget.
      Returns: the center widget
  */
  gid.gtk4.widget.Widget getCenterWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_box_get_center_widget(cast(GtkCenterBox*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the end widget.
      Returns: the end widget
  */
  gid.gtk4.widget.Widget getEndWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_box_get_end_widget(cast(GtkCenterBox*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the center widget shrinks after other children.
      Returns: whether to shrink the center widget after others
  */
  bool getShrinkCenterLast() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_center_box_get_shrink_center_last(cast(GtkCenterBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the start widget.
      Returns: the start widget
  */
  gid.gtk4.widget.Widget getStartWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_center_box_get_start_widget(cast(GtkCenterBox*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the baseline position of a center box.
      
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
    gtk_center_box_set_baseline_position(cast(GtkCenterBox*)this._cPtr, position);
  }

  /**
      Sets the center widget.
      
      To remove the existing center widget, pass `NULL`.
  
      Params:
        child = the new center widget
  */
  void setCenterWidget(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_center_box_set_center_widget(cast(GtkCenterBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the end widget.
      
      To remove the existing end widget, pass `NULL`.
  
      Params:
        child = the new end widget
  */
  void setEndWidget(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_center_box_set_end_widget(cast(GtkCenterBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to shrink the center widget after other children.
      
      By default, when there's no space to give all three children their
      natural widths, the start and end widgets start shrinking and the
      center child keeps natural width until they reach minimum width.
      
      If shrink_center_last is false, start and end widgets keep natural
      width and the center widget starts shrinking instead.
  
      Params:
        shrinkCenterLast = whether to shrink the center widget after others
  */
  void setShrinkCenterLast(bool shrinkCenterLast) nothrow
  {
    gtk_center_box_set_shrink_center_last(cast(GtkCenterBox*)this._cPtr, shrinkCenterLast);
  }

  /**
      Sets the start widget.
      
      To remove the existing start widget, pass `NULL`.
  
      Params:
        child = the new start widget
  */
  void setStartWidget(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_center_box_set_start_widget(cast(GtkCenterBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.center_box.CenterBox]
class CenterBoxGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /**
      Set `baselinePosition` property.
      Params:
        propval = The position of the baseline aligned widget if extra space is available.
      Returns: Builder instance for fluent chaining
  */
  T baselinePosition(gid.gtk4.types.BaselinePosition propval) nothrow
  {
    return setProperty("baseline-position", propval);
  }

  /**
      Set `centerWidget` property.
      Params:
        propval = The widget that is placed at the center position.
      Returns: Builder instance for fluent chaining
  */
  T centerWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("center-widget", propval);
  }

  /**
      Set `endWidget` property.
      Params:
        propval = The widget that is placed at the end position.
          
          In vertical orientation, the end position is at the bottom.
          In horizontal orientation, the end position is at the trailing
          edge with respect to the text direction.
      Returns: Builder instance for fluent chaining
  */
  T endWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("end-widget", propval);
  }

  /**
      Set `shrinkCenterLast` property.
      Params:
        propval = Whether to shrink the center widget after other children.
          
          By default, when there's no space to give all three children their
          natural widths, the start and end widgets start shrinking and the
          center child keeps natural width until they reach minimum width.
          
          If false, start and end widgets keep natural width and the
          center widget starts shrinking instead.
      Returns: Builder instance for fluent chaining
  */
  T shrinkCenterLast(bool propval) nothrow
  {
    return setProperty("shrink-center-last", propval);
  }

  /**
      Set `startWidget` property.
      Params:
        propval = The widget that is placed at the start position.
          
          In vertical orientation, the start position is at the top.
          In horizontal orientation, the start position is at the leading
          edge with respect to the text direction.
      Returns: Builder instance for fluent chaining
  */
  T startWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("start-widget", propval);
  }
}

/// Fluent builder for [gid.gtk4.center_box.CenterBox]
final class CenterBoxGidBuilder : CenterBoxGidBuilderImpl!CenterBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CenterBox build() nothrow
  {
    return new CenterBox(cast(void*)createGObject(CenterBox._getGType), Yes.Take);
  }
}
