/// Module for [RecentChooserWidget] class
module gid.gtk3.recent_chooser_widget;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.recent_chooser;
import gid.gtk3.recent_chooser_mixin;
import gid.gtk3.recent_manager;
import gid.gtk3.types;

/**
    #GtkRecentChooserWidget is a widget suitable for selecting recently used
    files.  It is the main building block of a #GtkRecentChooserDialog.  Most
    applications will only need to use the latter; you can use
    #GtkRecentChooserWidget as part of a larger window if you have special needs.
    
    Note that #GtkRecentChooserWidget does not have any methods of its own.
    Instead, you should use the functions that work on a #GtkRecentChooser.
    
    Recently used files are supported since GTK+ 2.10.
*/
@gidGir("RecentChooserWidget", "RecentChooserWidgetClass")
class RecentChooserWidget : gid.gtk3.box.Box, gid.gtk3.recent_chooser.RecentChooser
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
    return cast(void function())gtk_recent_chooser_widget_get_type != &gidSymbolNotFound ? gtk_recent_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRecentChooserWidget";
  }

  /** Returns `this`, for use in `with` statements. */
  override RecentChooserWidget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.recent_chooser_widget.RecentChooserWidget]
      Returns: New builder object
  */
  static RecentChooserWidgetGidBuilder builder() nothrow
  {
    return new RecentChooserWidgetGidBuilder;
  }

  mixin RecentChooserT!();

  /**
      Creates a new #GtkRecentChooserWidget object.  This is an embeddable widget
      used to access the recently used resources list.
      Returns: a new #GtkRecentChooserWidget
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
      _cretval = gtk_recent_chooser_widget_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkRecentChooserWidget with a specified recent manager.
      
      This is useful if you have implemented your own recent manager, or if you
      have a customized instance of a #GtkRecentManager object.
  
      Params:
        manager = a #GtkRecentManager
      Returns: a new #GtkRecentChooserWidget
  */
  static gid.gtk3.recent_chooser_widget.RecentChooserWidget newForManager(gid.gtk3.recent_manager.RecentManager manager) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_recent_chooser_widget_new_for_manager(manager ? cast(GtkRecentManager*)manager._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.recent_chooser_widget.RecentChooserWidget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.recent_chooser_widget.RecentChooserWidget]
class RecentChooserWidgetGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T, gid.gtk3.recent_chooser.RecentChooserGidBuilderImpl!T
{

  mixin RecentChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.recent_chooser_widget.RecentChooserWidget]
final class RecentChooserWidgetGidBuilder : RecentChooserWidgetGidBuilderImpl!RecentChooserWidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RecentChooserWidget build() nothrow
  {
    return new RecentChooserWidget(cast(void*)createGObject(RecentChooserWidget._getGType), Yes.Take);
  }
}
