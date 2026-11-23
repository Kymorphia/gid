/// Module for [ActionBar] class
module gid.gtk3.action_bar;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    GtkActionBar is designed to present contextual actions. It is
    expected to be displayed below the content and expand horizontally
    to fill the area.
    
    It allows placing children at the start or the end. In addition, it
    contains an internal centered box which is centered with respect to
    the full width of the box, even if the children at either side take
    up different amounts of space.
    
    # CSS nodes
    
    GtkActionBar has a single CSS node with name actionbar.
*/
class ActionBar : gid.gtk3.bin.Bin
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
    return cast(void function())gtk_action_bar_get_type != &gidSymbolNotFound ? gtk_action_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkActionBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override ActionBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.action_bar.ActionBar]
      Returns: New builder object
  */
  static ActionBarGidBuilder builder() nothrow
  {
    return new ActionBarGidBuilder;
  }

  /**
      Creates a new #GtkActionBar widget.
      Returns: a new #GtkActionBar
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
      _cretval = gtk_action_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Retrieves the center bar widget of the bar.
      Returns: the center #GtkWidget or null.
  */
  gid.gtk3.widget.Widget getCenterWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_bar_get_center_widget(cast(GtkActionBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds child to action_bar, packed with reference to the
      end of the action_bar.
  
      Params:
        child = the #GtkWidget to be added to action_bar
  */
  void packEnd(gid.gtk3.widget.Widget child) nothrow
  {
    gtk_action_bar_pack_end(cast(GtkActionBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds child to action_bar, packed with reference to the
      start of the action_bar.
  
      Params:
        child = the #GtkWidget to be added to action_bar
  */
  void packStart(gid.gtk3.widget.Widget child) nothrow
  {
    gtk_action_bar_pack_start(cast(GtkActionBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the center widget for the #GtkActionBar.
  
      Params:
        centerWidget = a widget to use for the center
  */
  void setCenterWidget(gid.gtk3.widget.Widget centerWidget = null) nothrow
  {
    gtk_action_bar_set_center_widget(cast(GtkActionBar*)this._cPtr, centerWidget ? cast(GtkWidget*)centerWidget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.action_bar.ActionBar]
class ActionBarGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.action_bar.ActionBar]
final class ActionBarGidBuilder : ActionBarGidBuilderImpl!ActionBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ActionBar build() nothrow
  {
    return new ActionBar(cast(void*)createGObject(ActionBar._getGType), Yes.Take);
  }
}
