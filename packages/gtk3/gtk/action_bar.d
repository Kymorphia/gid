/// Module for [ActionBar] class
module gtk.action_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

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
class ActionBar : gtk.bin.Bin
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
    return cast(void function())gtk_action_bar_get_type != &gidSymbolNotFound ? gtk_action_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ActionBar self()
  {
    return this;
  }

  /**
  Get builder for [gtk.action_bar.ActionBar]
  Returns: New builder object
  */
  static ActionBarGidBuilder builder()
  {
    return new ActionBarGidBuilder;
  }

  /**
      Creates a new #GtkActionBar widget.
      Returns: a new #GtkActionBar
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves the center bar widget of the bar.
      Returns: the center #GtkWidget or null.
  */
  gtk.widget.Widget getCenterWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_bar_get_center_widget(cast(GtkActionBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds child to action_bar, packed with reference to the
      end of the action_bar.
  
      Params:
        child = the #GtkWidget to be added to action_bar
  */
  void packEnd(gtk.widget.Widget child)
  {
    gtk_action_bar_pack_end(cast(GtkActionBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds child to action_bar, packed with reference to the
      start of the action_bar.
  
      Params:
        child = the #GtkWidget to be added to action_bar
  */
  void packStart(gtk.widget.Widget child)
  {
    gtk_action_bar_pack_start(cast(GtkActionBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the center widget for the #GtkActionBar.
  
      Params:
        centerWidget = a widget to use for the center
  */
  void setCenterWidget(gtk.widget.Widget centerWidget = null)
  {
    gtk_action_bar_set_center_widget(cast(GtkActionBar*)this._cPtr, centerWidget ? cast(GtkWidget*)centerWidget._cPtr(No.Dup) : null);
  }
}

class ActionBarGidBuilderImpl(T) : gtk.bin.BinGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.action_bar.ActionBar]
final class ActionBarGidBuilder : ActionBarGidBuilderImpl!ActionBarGidBuilder
{
  ActionBar build()
  {
    return new ActionBar(cast(void*)createGObject(ActionBar._getGType), No.Take);
  }
}
