/// Module for [RecentChooserWidget] class
module gtk.recent_chooser_widget;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.recent_chooser;
import gtk.recent_chooser_mixin;
import gtk.recent_manager;
import gtk.types;

/**
    #GtkRecentChooserWidget is a widget suitable for selecting recently used
    files.  It is the main building block of a #GtkRecentChooserDialog.  Most
    applications will only need to use the latter; you can use
    #GtkRecentChooserWidget as part of a larger window if you have special needs.
    
    Note that #GtkRecentChooserWidget does not have any methods of its own.
    Instead, you should use the functions that work on a #GtkRecentChooser.
    
    Recently used files are supported since GTK+ 2.10.
*/
class RecentChooserWidget : gtk.box.Box, gtk.recent_chooser.RecentChooser
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_recent_chooser_widget_get_type != &gidSymbolNotFound ? gtk_recent_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override RecentChooserWidget self()
  {
    return this;
  }

  mixin RecentChooserT!();

  /**
      Creates a new #GtkRecentChooserWidget object.  This is an embeddable widget
      used to access the recently used resources list.
      Returns: a new #GtkRecentChooserWidget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_recent_chooser_widget_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkRecentChooserWidget with a specified recent manager.
      
      This is useful if you have implemented your own recent manager, or if you
      have a customized instance of a #GtkRecentManager object.
  
      Params:
        manager = a #GtkRecentManager
      Returns: a new #GtkRecentChooserWidget
  */
  static gtk.recent_chooser_widget.RecentChooserWidget newForManager(gtk.recent_manager.RecentManager manager)
  {
    GtkWidget* _cretval;
    _cretval = gtk_recent_chooser_widget_new_for_manager(manager ? cast(GtkRecentManager*)manager.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.recent_chooser_widget.RecentChooserWidget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
